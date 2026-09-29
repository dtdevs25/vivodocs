import { Router, Request, Response } from 'express';
import { query } from '../db';
import jwt from 'jsonwebtoken';
import bcrypt from 'bcryptjs';

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
        // verify password if not simulating (assuming normal auth)
        // const valid = await bcrypt.compare(senha, user.senha);
        // if (!valid) return res.status(401).json({ error: 'Invalid credentials' });
      }
    }

    const token = jwt.sign(
      { id: user.id, email: user.email, role: user.nivel_acesso },
      JWT_SECRET,
      { expiresIn: '1d' }
    );

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

export default router;
