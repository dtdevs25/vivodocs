import { Router, Request, Response } from 'express';
import { query } from '../db';
import multer from 'multer';
import xlsx from 'xlsx';

const router = Router();
const upload = multer({ storage: multer.memoryStorage() });

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

// Upload seed excel
router.post('/upload-seed', upload.single('file'), async (req: Request, res: Response) => {
  if (!req.file) {
    res.status(400).json({ error: 'No file uploaded' });
    return;
  }

  try {
    const workbook = xlsx.read(req.file.buffer, { type: 'buffer' });
    
    // Ler a aba 'GERAL'
    const sheetGeral = workbook.Sheets['GERAL'];
    if (!sheetGeral) {
      res.status(400).json({ error: 'Aba "GERAL" não encontrada na planilha.' });
      return;
    }

    const data: any[] = xlsx.utils.sheet_to_json(sheetGeral, { header: 1 });
    const rows = data.slice(1).filter(r => r[0]); // Pular header e ignorar linhas sem CNPJ

    await query('BEGIN');

    let countUnidades = 0;
    
    for (const r of rows) {
      const cnpj = String(r[0] || '').trim();
      if (!cnpj) continue;
      
      const escopo_iso = String(r[1] || '').trim().toUpperCase() === 'SIM';
      // PGR / LTCAT / AEP
      const pgrAno = String(r[2] || '');
      const pgrLista = String(r[3] || '');
      const ltcatLista = String(r[5] || '');
      const aepLista = String(r[7] || '');
      
      const filial = String(r[11] || '');
      const tipo_predio = String(r[12] || '');
      const uf = String(r[13] || '');
      const cidade = String(r[14] || '');
      const bairro = String(r[15] || '');
      const endereco = String(r[16] || '');
      const regional = String(r[17] || '');
      
      const nr20 = String(r[18] || '').trim().toUpperCase() === 'SIM';
      const mes_ano_po = String(r[19] || '');
      const observacoes = String(r[20] || '');

      // Upsert Unidade Ativa
      const resultUnidade = await query(
        `INSERT INTO unidades_ativas (cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12)
         ON CONFLICT (cnpj) DO UPDATE SET
         filial = EXCLUDED.filial, regional = EXCLUDED.regional, uf = EXCLUDED.uf, cidade = EXCLUDED.cidade,
         updated_at = NOW()
         RETURNING id`,
        [cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso, nr20, mes_ano_po, observacoes]
      );
      
      const unidadeId = resultUnidade.rows[0].id;
      countUnidades++;

      // Inserir documentos simplificado (PGR, LTCAT, AEP)
      await query(`DELETE FROM documentos_sst WHERE unidade_id = $1`, [unidadeId]);
      
      if (pgrLista) {
        await query(`INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega) VALUES ($1, 'PGR', $2, $3)`, [unidadeId, pgrAno, pgrLista]);
      }
      if (ltcatLista) {
        await query(`INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega) VALUES ($1, 'LTCAT', $2)`, [unidadeId, ltcatLista]);
      }
      if (aepLista) {
        await query(`INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega) VALUES ($1, 'AEP', $2)`, [unidadeId, aepLista]);
      }
    }

    await query('COMMIT');
    res.json({ message: 'Planilha processada com sucesso!', unidadesProcessadas: countUnidades });
  } catch (err) {
    await query('ROLLBACK');
    console.error(err);
    res.status(500).json({ error: 'Erro ao processar a planilha', details: err });
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

export default router;
