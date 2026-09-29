import { Router, Request, Response } from 'express';
import { query } from '../db';

const router = Router();

// Get all units
router.get('/', async (req: Request, res: Response) => {
  try {
    const { rows } = await query('SELECT * FROM unidades_ativas ORDER BY id DESC');
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Create a new unit
router.post('/', async (req: Request, res: Response) => {
  const { cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes } = req.body;
  try {
    const { rows } = await query(
      `INSERT INTO unidades_ativas (cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) RETURNING *`,
      [cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes]
    );
    res.status(201).json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Demobilize a unit
router.post('/:id/desmobilizar', async (req: Request, res: Response) => {
  const { id } = req.params;
  const { motivo_desmobilizacao, data_desmobilizacao } = req.body;

  try {
    await query('BEGIN');
    
    const { rows } = await query('SELECT * FROM unidades_ativas WHERE id = $1', [id]);
    if (rows.length === 0) {
      res.status(404).json({ error: 'Unidade not found' });
      return;
    }
    const unidade = rows[0];

    // Insert into unidades_desmobilizadas
    await query(
      `INSERT INTO unidades_desmobilizadas (cnpj, filial, regional, uf, cidade, motivo_desmobilizacao, data_desmobilizacao)
       VALUES ($1, $2, $3, $4, $5, $6, $7)`,
      [unidade.cnpj, unidade.filial, unidade.regional, unidade.uf, unidade.cidade, motivo_desmobilizacao, data_desmobilizacao]
    );

    // Delete from unidades_ativas
    await query('DELETE FROM unidades_ativas WHERE id = $1', [id]);
    
    await query('COMMIT');
    res.json({ message: 'Unidade desmobilizada com sucesso' });
  } catch (err) {
    await query('ROLLBACK');
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Seed endpoint using XLSX
// In a real app, you would use multer to upload the file, then read it.
// Here we have a simple placeholder for the seed route.

export default router;
