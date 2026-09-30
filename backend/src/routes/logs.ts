import { Router, Request, Response } from 'express';
import { query } from '../db';

const router = Router();

// GET all logs
router.get('/', async (req: Request, res: Response) => {
  try {
    const { rows } = await query("SELECT * FROM sistema_logs ORDER BY created_at DESC LIMIT 500");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

export default router;
