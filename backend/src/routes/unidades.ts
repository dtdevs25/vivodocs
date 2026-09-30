import { Router, Request, Response } from 'express';
import { query } from '../db';
import multer from 'multer';
import xlsx from 'xlsx';

const router = Router();
const upload = multer({ storage: multer.memoryStorage() });

// Get ALL units (Ativas, Desmobilizadas, DGs, Techs) for consolidated management
router.get('/', async (req: Request, res: Response) => {
  try {
    const { rows } = await query("SELECT * FROM unidades ORDER BY status_funcionamento ASC, filial ASC");
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Upload seed excel
router.post('/upload-seed', upload.single('file'), async (req: Request, res: Response) => {
  // ... Keep existing upload-seed logic ...
  if (!req.file) {
    res.status(400).json({ error: 'No file uploaded' });
    return;
  }

  try {
    const workbook = xlsx.read(req.file.buffer, { type: 'buffer' });
    const sheetGeral = workbook.Sheets['GERAL'];
    if (!sheetGeral) {
      res.status(400).json({ error: 'Aba "GERAL" não encontrada na planilha.' });
      return;
    }

    const data: any[] = xlsx.utils.sheet_to_json(sheetGeral, { header: 1 });
    const rows = data.slice(1).filter(r => r[0]); 

    await query('BEGIN');
    let countUnidades = 0;
    
    for (const r of rows) {
      const cnpj = String(r[0] || '').trim();
      if (!cnpj) continue;
      
      const escopo_iso = String(r[1] || '').trim().toUpperCase() === 'SIM';
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

      const resultUnidade = await query(
        `INSERT INTO unidades (cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes, status_funcionamento)
         VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, 'ATIVA')
         ON CONFLICT (cnpj) DO UPDATE SET
         filial = EXCLUDED.filial, regional = EXCLUDED.regional, uf = EXCLUDED.uf, cidade = EXCLUDED.cidade,
         updated_at = NOW()
         RETURNING id`,
        [cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso, nr20, mes_ano_po, observacoes]
      );
      
      const unidadeId = resultUnidade.rows[0].id;
      countUnidades++;

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

router.post('/', async (req: Request, res: Response) => {
  const { cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes } = req.body;
  try {
    const { rows } = await query(
      `INSERT INTO unidades (cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes)
       VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) RETURNING *`,
      [cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes]
    );
    res.status(201).json(rows[0]);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.post('/:id/desmobilizar', async (req: Request, res: Response) => {
  const { id } = req.params;
  const { motivo_desmobilizacao, data_desmobilizacao } = req.body;
  try {
    await query(
      `UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA', motivo_desmobilizacao = $1, data_desmobilizacao = $2 WHERE id = $3`,
      [motivo_desmobilizacao, data_desmobilizacao, id]
    );
    res.json({ message: 'Unidade desmobilizada com sucesso' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

// Real Dashboard metrics
router.get('/dashboard', async (req: Request, res: Response) => {
  try {
    const { rows: ativas } = await query("SELECT COUNT(*) as total FROM unidades WHERE status_funcionamento = 'ATIVA'");
    
    // PGRs vigentes = ano 2026+ ou status verde
    // PGRs vencendo = ano 2025 ou amarelado
    // PGRs vencidos = ano 2024, 2023 ou status Venceu
    const { rows: pgrs } = await query("SELECT ano, status FROM documentos_sst WHERE tipo_documento = 'PGR'");
    
    let vigentes = 0, vencendo = 0, vencidos = 0, pendentes = 0;
    
    pgrs.forEach(d => {
      const year = parseInt(d.ano);
      if (d.status === 'Venceu') vencidos++;
      else if (d.status === 'Vigente') vigentes++;
      else if (year >= 2026) vigentes++;
      else if (year === 2025) vencendo++;
      else if (year <= 2024) vencidos++;
      else pendentes++;
    });
    
    // Coverage: Unidades com PGR, LTCAT, AEP, AET vs Totais
    const { rows: docsTotal } = await query("SELECT COUNT(DISTINCT unidade_id) as total_cobertas FROM documentos_sst");
    
    res.json({
      total_ativas: ativas[0].total,
      pgrs_vigentes: vigentes,
      pgrs_vencendo: vencendo,
      pgrs_vencidos: vencidos,
      pendentes: pendentes,
      cobertura: Math.round((parseInt(docsTotal[0].total_cobertas) / Math.max(parseInt(ativas[0].total), 1)) * 100),
      hc_monitorado: 0 // Mock until HC logic exists
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao buscar dashboard' });
  }
});

// Matriz de Documentos
router.get('/matriz', async (req: Request, res: Response) => {
  try {
    const { rows } = await query(`
      SELECT 
          u.id, u.cnpj, u.filial, u.uf, u.cidade, u.is_dg, u.status_funcionamento,
          MAX(CASE WHEN d.tipo_documento = 'PGR' THEN COALESCE(d.ano, d.status, d.lista_entrega, 'OK') END) as pgr,
          MAX(CASE WHEN d.tipo_documento = 'LTCAT' THEN COALESCE(d.ano, d.status, d.lista_entrega, 'OK') END) as ltcat,
          MAX(CASE WHEN d.tipo_documento = 'AEP' THEN COALESCE(d.ano, d.status, d.lista_entrega, 'OK') END) as aep,
          MAX(CASE WHEN d.tipo_documento = 'AET' THEN COALESCE(d.ano, d.status, d.lista_entrega, 'OK') END) as aet,
          MAX(CASE WHEN d.tipo_documento = 'NR01' THEN COALESCE(d.ano, d.status, d.lista_entrega, 'OK') END) as nr01
      FROM unidades u
      LEFT JOIN documentos_sst d ON u.id = d.unidade_id
      GROUP BY u.id, u.cnpj, u.filial, u.uf, u.cidade, u.is_dg, u.status_funcionamento
      ORDER BY u.status_funcionamento ASC, u.filial ASC
    `);
    res.json(rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Erro ao montar matriz' });
  }
});

export default router;
