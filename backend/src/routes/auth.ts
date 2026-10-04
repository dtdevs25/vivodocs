import { Router, Request, Response } from 'express';
import { query } from '../db';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import speakeasy from 'speakeasy';
import QRCode from 'qrcode';
import { logAction } from '../utils/logger';
import { sendWelcomeEmail } from '../utils/mailer';
import rateLimit from 'express-rate-limit';
import multer from 'multer';
import { uploadToS3 } from '../utils/s3';

const router = Router();
const JWT_SECRET = process.env.JWT_SECRET || 'secret';

const loginLimiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 10,
  message: { error: 'Muitas tentativas de login. Bloqueado por 15 minutos.' }
});

// Login route
const upload = multer({ storage: multer.memoryStorage() });

router.post('/avatar', upload.single('file'), async (req: Request, res: Response) => {
  const { email } = req.body;
  const file = req.file;
  if (!email || !file) return res.status(400).json({ error: 'Faltando dados' });
  try {
    const s3Key = `avatars/${Date.now()}-${file.originalname.replace(/[^a-zA-Z0-9.-]/g, '_')}`;
    await uploadToS3(file.buffer, s3Key, file.mimetype);
    // Build S3 URL assuming bucket is public or minio endpoint is mapped
    const bucket = process.env.S3_BUCKET_NAME || 'vivodocs';
    const endpoint = process.env.S3_ENDPOINT || 'http://localhost:9000';
    const s3Host = endpoint.includes('amazonaws.com') 
      ? `https://${bucket}.s3.${process.env.AWS_REGION}.amazonaws.com`
      : `${endpoint}/${bucket}`;
    const avatarUrl = `${s3Host}/${s3Key}`;
    
    await query('UPDATE usuarios SET avatar_url = $1 WHERE email = $2', [avatarUrl, email]);
    res.json({ avatar_url: avatarUrl });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao fazer upload do avatar' });
  }
});

router.post('/login', loginLimiter, async (req: Request, res: Response) => {
  const { email, senha, simularNivel } = req.body;
  
  try {
    // Check if user exists
    let { rows } = await query('SELECT * FROM usuarios WHERE email = $1', [email]);
    let user = rows[0];

    // For demonstration/setup, if user does not exist, let's create it with the simulated level
    if (!user) {
      const hashedPassword = await bcrypt.hash(senha || 'nova@2026', 10);
      const insertResult = await query(
        `INSERT INTO usuarios (nome, email, senha, nivel_acesso) VALUES ($1, $2, $3, $4) RETURNING *`,
        [email.split('@')[0], email, hashedPassword, simularNivel || 'master']
      );
      user = insertResult.rows[0];
    } else {
      // If we are simulating level, let's just update the user role for testing purposes (since they asked to simulate)
      if (simularNivel && simularNivel !== user.nivel_acesso) {
        const updateResult = await query(
          `UPDATE usuarios SET nivel_acesso = $1 WHERE id = $2 RETURNING *`,
          [simularNivel, user.id]
        );
        user = updateResult.rows[0];
      } else {
        const valid = await bcrypt.compare(senha, user.senha);
        if (!valid) {
          res.status(401).json({ error: 'Senha incorreta' });
          return;
        }
      }
    }

    if (user.two_factor_enabled) {
      // Create a temporary token that allows the user to complete 2FA
      const tempToken = jwt.sign({ tempId: user.id, email: user.email }, JWT_SECRET, { expiresIn: '15m' });
      res.json({ requires_2fa: true, tempToken, email: user.email });
      return;
    }

    const token = jwt.sign(
      { id: user.id, email: user.email, role: user.nivel_acesso },
      JWT_SECRET,
      { expiresIn: '1d' }
    );
    
    await logAction(user.email, 'LOGIN', 'Usuário acessou o sistema.');

    res.json({
      token,
      user: {
        id: user.id,
        nome: user.nome,
        email: user.email,
        role: user.nivel_acesso
      }
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Admin: get all users
router.get('/users', async (req: Request, res: Response) => {
  try {
    const { rows } = await query('SELECT id, nome, email, nivel_acesso, created_at, recebe_notificacao FROM usuarios ORDER BY id DESC');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar usuários' });
  }
});

// Admin: create user
router.post('/users', async (req: Request, res: Response) => {
  const { nome, email, nivel_acesso, senha, frontendUrl, recebe_notificacao } = req.body;
  try {
    const hashedPassword = await bcrypt.hash(senha || 'nova@2026', 10);
    const { rows } = await query(
      'INSERT INTO usuarios (nome, email, senha, nivel_acesso, recebe_notificacao) VALUES ($1, $2, $3, $4, $5) RETURNING id, nome, email, nivel_acesso, recebe_notificacao',
      [nome, email, hashedPassword, nivel_acesso, recebe_notificacao !== undefined ? recebe_notificacao : true]
    );
    await logAction('sistema@vivo.com', 'CRIAR_USUARIO', `Usuário ${email} cadastrado.`);
    
    // Send email with token
    const token = jwt.sign({ id: rows[0].id, email }, JWT_SECRET, { expiresIn: '12h' });
    await sendWelcomeEmail(email, nome, token, frontendUrl || 'http://localhost:5173');
    
    res.json(rows[0]);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao criar usuário' });
  }
});

// Admin: reset password
router.post('/users/:id/reset', async (req: Request, res: Response) => {
  const { id } = req.params;
  const { frontendUrl } = req.body;
  try {
    const { rows } = await query('SELECT nome, email FROM usuarios WHERE id = $1', [id]);
    if (rows.length === 0) {
      res.status(404).json({ error: 'User not found' });
      return;
    }
    const user = rows[0];
    const token = jwt.sign({ id, email: user.email }, JWT_SECRET, { expiresIn: '12h' });
    await sendWelcomeEmail(user.email, user.nome, token, frontendUrl || 'http://localhost:5173');
    res.json({ message: 'E-mail para criação de senha enviado com sucesso.' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao resetar senha' });
  }
});

// Create/Reset password with token
router.post('/reset-password-with-token', async (req: Request, res: Response) => {
  const { token, newPassword } = req.body;
  try {
    const decoded = jwt.verify(token, JWT_SECRET) as { id: string, email: string };
    const hashedPassword = await bcrypt.hash(newPassword, 10);
    await query('UPDATE usuarios SET senha = $1 WHERE id = $2', [hashedPassword, decoded.id]);
    await logAction('sistema@vivo.com', 'SENHA_CRIADA', `Usuário ${decoded.email} definiu a própria senha.`);
    res.json({ message: 'Senha atualizada com sucesso' });
  } catch (err) {
    res.status(400).json({ error: 'Link inválido ou expirado. Solicite ao administrador um novo reenvio.' });
  }
});

// Forgot password
router.post('/forgot-password', async (req: Request, res: Response) => {
  const { email, frontendUrl } = req.body;
  try {
    const { rows } = await query('SELECT id, nome, email FROM usuarios WHERE email = $1', [email]);
    if (rows.length === 0) {
      res.status(404).json({ error: 'Usuário não está cadastrado.' });
      return;
    }
    const user = rows[0];
    const token = jwt.sign({ id: user.id, email: user.email }, JWT_SECRET, { expiresIn: '12h' });
    await sendWelcomeEmail(user.email, user.nome, token, frontendUrl || 'http://localhost:5173');
    await logAction(user.email, 'ESQUECI_SENHA', `Solicitou redefinição de senha.`);
    res.json({ message: 'E-mail de redefinição enviado com sucesso.' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao solicitar redefinição.' });
  }
});

// Admin: get logs
router.get('/logs', async (req: Request, res: Response) => {
  try {
    const { rows } = await query('SELECT * FROM sistema_logs ORDER BY created_at DESC LIMIT 100');
    res.json(rows);
  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar logs' });
  }
});

// Admin: edit user
router.put('/users/:id', async (req: Request, res: Response) => {
  const { id } = req.params;
  const { nome, email, nivel_acesso, recebe_notificacao } = req.body;
  try {
    await query('UPDATE usuarios SET nome = $1, email = $2, nivel_acesso = $3, recebe_notificacao = $4 WHERE id = $5', [nome, email, nivel_acesso, recebe_notificacao !== undefined ? recebe_notificacao : true, id]);
    await logAction('sistema@vivo.com', 'EDITAR_USUARIO', `Usuário ${email} (ID ${id}) editado.`);
    res.json({ message: 'Usuário atualizado com sucesso' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao atualizar usuário' });
  }
});

// Admin: delete user
router.delete('/users/:id', async (req: Request, res: Response) => {
  const { id } = req.params;
  try {
    await query('DELETE FROM usuarios WHERE id = $1', [id]);
    await logAction('sistema@vivo.com', 'EXCLUIR_USUARIO', `Usuário ID ${id} excluído.`);
    res.json({ message: 'Usuário excluído com sucesso' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao excluir usuário' });
  }
});

// Admin: get notification config
router.get('/notificacoes-config', async (req: Request, res: Response) => {
  try {
    const { rows } = await query('SELECT * FROM notificacoes_config WHERE id = 1');
    res.json(rows[0] || {});
  } catch (err) {
    res.status(500).json({ error: 'Erro ao buscar configuração' });
  }
});

// Admin: update notification config
router.put('/notificacoes-config', async (req: Request, res: Response) => {
  const { dias_alerta_1, dias_alerta_2, dias_alerta_3, email_customizado, validade_pgr, validade_ltcat, validade_aep, validade_aet, validade_nr01 } = req.body;
  try {
    await query(
      'UPDATE notificacoes_config SET dias_alerta_1 = $1, dias_alerta_2 = $2, dias_alerta_3 = $3, email_customizado = $4, validade_pgr = $5, validade_ltcat = $6, validade_aep = $7, validade_aet = $8, validade_nr01 = $9, updated_at = NOW() WHERE id = 1',
      [dias_alerta_1, dias_alerta_2, dias_alerta_3, email_customizado, validade_pgr, validade_ltcat, validade_aep, validade_aet, validade_nr01]
    );
    await logAction('sistema@vivo.com', 'EDITAR_CONFIG_NOTIF', 'Configurações de notificação/validade atualizadas.');
    res.json({ message: 'Configuração atualizada com sucesso' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao atualizar configuração' });
  }
});

// 2FA Routes
router.post('/2fa/verify-login', async (req: Request, res: Response) => {
  const { tempToken, code } = req.body;
  try {
    const decoded = jwt.verify(tempToken, JWT_SECRET) as { tempId: string, email: string };
    const { rows } = await query('SELECT * FROM usuarios WHERE id = $1', [decoded.tempId]);
    const user = rows[0];
    
    if (!user || !user.two_factor_enabled) {
      res.status(400).json({ error: '2FA não está ativado ou usuário inválido' });
      return;
    }

    const verified = speakeasy.totp.verify({
      secret: user.two_factor_secret,
      encoding: 'base32',
      token: code,
      window: 1 // allows 30 seconds of drift
    });

    if (verified) {
      const token = jwt.sign(
        { id: user.id, email: user.email, role: user.nivel_acesso },
        JWT_SECRET,
        { expiresIn: '1d' }
      );
      await logAction(user.email, 'LOGIN_2FA', 'Usuário acessou o sistema com 2FA.');
      res.json({
        token,
        user: { id: user.id, nome: user.nome, email: user.email, role: user.nivel_acesso }
      });
    } else {
      res.status(401).json({ error: 'Código 2FA inválido' });
    }
  } catch (err) {
    res.status(401).json({ error: 'Token temporário expirado ou inválido' });
  }
});

router.post('/2fa/generate', async (req: Request, res: Response) => {
  const { email } = req.body; // In a real system, use an authenticated token here
  try {
    const secret = speakeasy.generateSecret({ name: `VivoDocSafe (${email})` });
    await query('UPDATE usuarios SET two_factor_secret = $1 WHERE email = $2', [secret.base32, email]);
    
    const qrCodeUrl = await QRCode.toDataURL(secret.otpauth_url!);
    res.json({ secret: secret.base32, qrCodeUrl });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao gerar 2FA' });
  }
});

router.post('/2fa/enable', async (req: Request, res: Response) => {
  const { email, code } = req.body;
  try {
    const { rows } = await query('SELECT two_factor_secret FROM usuarios WHERE email = $1', [email]);
    if (rows.length === 0) {
       res.status(404).json({ error: 'Usuário não encontrado' });
       return;
    }

    const verified = speakeasy.totp.verify({
      secret: rows[0].two_factor_secret,
      encoding: 'base32',
      token: code,
      window: 1
    });

    if (verified) {
      await query('UPDATE usuarios SET two_factor_enabled = true WHERE email = $1', [email]);
      await logAction(email, 'ENABLE_2FA', 'Usuário ativou 2FA.');
      res.json({ message: '2FA ativado com sucesso!' });
    } else {
      res.status(400).json({ error: 'Código inválido. Tente novamente.' });
    }
  } catch (err) {
    res.status(500).json({ error: 'Erro ao ativar 2FA' });
  }
});

router.post('/2fa/disable', async (req: Request, res: Response) => {
  const { email, senha } = req.body;
  try {
    const { rows } = await query('SELECT * FROM usuarios WHERE email = $1', [email]);
    if (rows.length === 0) {
       res.status(404).json({ error: 'Usuário não encontrado' });
       return;
    }
    
    const user = rows[0];
    const valid = await bcrypt.compare(senha, user.senha);
    if (!valid) {
      res.status(401).json({ error: 'Senha incorreta' });
      return;
    }

    await query('UPDATE usuarios SET two_factor_enabled = false, two_factor_secret = null WHERE email = $1', [email]);
    await logAction(email, 'DISABLE_2FA', 'Usuário desativou 2FA.');
    res.json({ message: '2FA desativado com sucesso!' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao desativar 2FA' });
  }
});

export default router;
