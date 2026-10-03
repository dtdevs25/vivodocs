import express from 'express';
import { query, pool } from '../db';
import dotenv from 'dotenv';
import { logAction } from '../utils/logger';

dotenv.config();

const router = express.Router();

// GET all faturamento records
router.get('/', async (req, res) => {
  try {
    const result = await query('SELECT * FROM faturamento_lancamentos ORDER BY created_at DESC');
    res.json(result.rows);
  } catch (error) {
    console.error('Error fetching faturamento:', error);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// GET sum of faturamento
router.get('/resumo', async (req, res) => {
    try {
      const result = await query(`
        SELECT 
          SUM(qtd_pgr) as total_pgr,
          SUM(qtd_ltcat) as total_ltcat,
          SUM(qtd_aep + qtd_aet + qtd_insalubridade + qtd_diversos) as total_aet,
          SUM(valor_total) as total_liquido,
          SUM(valor_total + desconto) as total_valor_bruto
        FROM faturamento_lancamentos
      `);
      res.json(result.rows[0]);
    } catch (error) {
      console.error('Error fetching faturamento summary:', error);
      res.status(500).json({ error: 'Internal server error' });
    }
});

// POST novo lançamento
router.post('/', async (req, res) => {
  const client = await pool.connect();
  try {
    await client.query('BEGIN');
    const data = req.body;
    
    const lancamentoRes = await client.query(`
      INSERT INTO faturamento_lancamentos (
        lista_lote, justificativa, 
        qtd_pgr, valor_unit_pgr,
        qtd_ltcat, valor_unit_ltcat,
        qtd_aep, valor_unit_aep,
        qtd_aet, valor_unit_aet,
        qtd_insalubridade, valor_unit_insalubridade,
        qtd_diversos, valor_unit_diversos,
        desconto, valor_total
      ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14, $15, $16)
      RETURNING id
    `, [
      data.lista_lote, data.justificativa,
      data.qtd_pgr || 0, data.valor_unit_pgr || 0,
      data.qtd_ltcat || 0, data.valor_unit_ltcat || 0,
      data.qtd_aep || 0, data.valor_unit_aep || 0,
      data.qtd_aet || 0, data.valor_unit_aet || 0,
      data.qtd_insalubridade || 0, data.valor_unit_insalubridade || 0,
      data.qtd_diversos || 0, data.valor_unit_diversos || 0,
      data.desconto || 0, data.valor_total || 0
    ]);
    
    const lancamentoId = lancamentoRes.rows[0].id;
    
    if (data.unidades && Array.isArray(data.unidades) && data.unidades.length > 0) {
      for (const unidadeId of data.unidades) {
        await client.query(`
          INSERT INTO faturamento_lancamento_unidades (lancamento_id, unidade_id)
          VALUES ($1, $2)
        `, [lancamentoId, unidadeId]);
      }
    }
    
    await logAction('sistema@vivo.com', 'NOVO_LANCAMENTO', `Lançamento ${data.lista_lote} salvo com sucesso.`);
    
    await client.query('COMMIT');
    res.json({ success: true, id: lancamentoId });
  } catch (error) {
    await client.query('ROLLBACK');
    console.error('Error saving lancamento:', error);
    res.status(500).json({ error: 'Erro ao salvar lançamento' });
  } finally {
    client.release();
  }
});

export default router;
