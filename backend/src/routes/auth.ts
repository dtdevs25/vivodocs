import { Router, Request, Response } from 'express';
import { query } from '../db';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';
import { logAction } from '../utils/logger';
import { sendWelcomeEmail } from '../utils/mailer';

const router = Router();
const JWT_SECRET = process.env.JWT_SECRET || 'secret';

// Login route
router.post('/login', async (req: Request, res: Response) => {
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
  const { dias_alerta_1, dias_alerta_2, dias_alerta_3, email_customizado } = req.body;
  try {
    await query(
      'UPDATE notificacoes_config SET dias_alerta_1 = $1, dias_alerta_2 = $2, dias_alerta_3 = $3, email_customizado = $4, updated_at = NOW() WHERE id = 1',
      [dias_alerta_1, dias_alerta_2, dias_alerta_3, email_customizado]
    );
    await logAction('sistema@vivo.com', 'EDITAR_CONFIG_NOTIF', 'Configurações de notificação atualizadas.');
    res.json({ message: 'Configuração atualizada com sucesso' });
  } catch (err) {
    res.status(500).json({ error: 'Erro ao atualizar configuração' });
  }
});

export default router;
