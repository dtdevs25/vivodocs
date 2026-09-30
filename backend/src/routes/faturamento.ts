import express from 'express';
import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const router = express.Router();

const pool = new Pool({
  user: process.env.DB_USER || 'postgres',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'sistemavivo',
  password: process.env.DB_PASSWORD || 'postgres',
  port: parseInt(process.env.DB_PORT || '5432'),
});

// GET all faturamento records
router.get('/', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM faturamento_medicoes ORDER BY created_at DESC');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching faturamento:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET sum of faturamento
router.get('/resumo', async (req, res) => {
    try {
      const result = await pool.query(`
        SELECT 
          SUM(quantidade_pgr) as total_pgr,
          SUM(quantidade_ltcat) as total_ltcat,
          SUM(quantidade_aet) as total_aet,
          SUM(valor_bruto) as total_valor_bruto,
          SUM(descontos) as total_descontos,
          SUM(valor_bruto - descontos) as total_liquido
        FROM faturamento_medicoes
      `);
      res.json(result.rows[0]);
    } catch (error) {
      console.error('Error fetching faturamento summary:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
});

export default router;
