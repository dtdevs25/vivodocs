import xlsx from 'xlsx';
import { query } from './backend/src/db';
import fs from 'fs';
import path from 'path';

async function run() {
  const filePath = "c:/Users/Daniel/Desktop/Sistemavivo/CONTROLE PGR_2026_V4.xlsx";
  console.log(`Lendo o arquivo: ${filePath}`);
  const workbook = xlsx.readFile(filePath);
  
  // Analisando aba GERAL
  const sheetGeral = workbook.Sheets['GERAL'];
  const geralData = xlsx.utils.sheet_to_json(sheetGeral, { defval: null });
  
  // Analisando aba DGs
  const sheetDgs = workbook.Sheets['DGs'];
  const dgsData = xlsx.utils.sheet_to_json(sheetDgs, { defval: null });
  
  // Analisando aba DESMOBILIZADO
  const sheetDesmobilizado = workbook.Sheets['DESMOBILIZADO'];
  const desmobilizadoData = xlsx.utils.sheet_to_json(sheetDesmobilizado, { defval: null });

  let totalDgs = 0;
  let totalIso = 0;
  let totalLojas = 0;
  let totalPredios = 0;

  console.log(`Aba GERAL possui ${geralData.length} linhas.`);
  console.log(`Aba DGs possui ${dgsData.length} linhas.`);
  console.log(`Aba DESMOBILIZADO possui ${desmobilizadoData.length} linhas.`);

  await query('BEGIN');
  try {
    for (const row of geralData) {
      const cnpj = row['CNPJ']?.toString().trim();
      if (!cnpj) continue;

      const unidade = row['UNIDADE']?.toString().trim();
      const iso = row['ISSO']?.toString().trim() === 'ESCOPO ISO';
      const filial = row['FILIAL']?.toString().trim() || null;
      const cidade = row['CIDADE']?.toString().trim() || null;
      const uf = row['UF']?.toString().trim() || null;
      
      if (unidade === 'Loja') totalLojas++;
      if (unidade === 'Prédio' || unidade === 'Prédio ') totalPredios++;
      if (iso) totalIso++;

      // Upsert unidade
      const resUnidade = await query(`
        INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, escopo_iso_45001, status_funcionamento)
        VALUES ($1, $2, $3, $4, $5, $6, 'ATIVA')
        ON CONFLICT (cnpj) DO UPDATE SET
          filial = EXCLUDED.filial,
          tipo_predio = EXCLUDED.tipo_predio,
          cidade = EXCLUDED.cidade,
          uf = EXCLUDED.uf,
          escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
          status_funcionamento = 'ATIVA'
        RETURNING id
      `, [cnpj, filial, unidade, cidade, uf, iso]);
      
      const unidadeId = resUnidade.rows[0].id;

      // PGR
      const pgrLista = row['PGR LISTA'] || row['LISTA '];
      const pgrRev = row['REVISÃO '];
      let pgrVenc = row['VENCIMENTO '];
      if (pgrLista && pgrRev) {
        let revDate = new Date(pgrRev);
        if (!isNaN(revDate.getTime())) {
          // Rule: 2 years if not ISO, 3 years if ISO
          let vencYear = revDate.getFullYear() + (iso ? 3 : 2);
          
          await query(`
            INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
            VALUES ($1, 'PGR', $2, $3, 'Vigente', $4, $5)
          `, [unidadeId, vencYear.toString(), pgrLista.toString(), revDate, new Date(revDate.setFullYear(vencYear))]);
        }
      }

      // LTCAT
      const ltcatLista = row['LTCAT LISTA'] || row['LTCAT'];
      const ltcatAno = row['ANO LTCAT'];
      if (ltcatLista && ltcatAno) {
        await query(`
          INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
          VALUES ($1, 'LTCAT', $2, $3, 'Vigente')
        `, [unidadeId, ltcatAno.toString(), ltcatLista.toString()]);
      }

      // AEP
      const aepLista = row['AEP LISTA'] || row['AEP'];
      const aepAno = row['ANO AEP'];
      if (aepLista && aepAno) {
        await query(`
          INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
          VALUES ($1, 'AEP', $2, $3, 'Vigente')
        `, [unidadeId, aepAno.toString(), aepLista.toString()]);
      }
    }

    // Process DGs
    for (const row of dgsData) {
      const cnpj = row['CNPJ']?.toString().trim();
      if (!cnpj || !cnpj.includes('DG')) continue;
      totalDgs++;
      
      const filial = row['Nome da Empresa']?.toString().trim();
      
      const resUnidade = await query(`
        INSERT INTO unidades (cnpj, filial, tipo_predio, status_funcionamento, is_dg)
        VALUES ($1, $2, 'DG', 'ATIVA', true)
        ON CONFLICT (cnpj) DO UPDATE SET
          is_dg = true,
          status_funcionamento = 'ATIVA'
        RETURNING id
      `, [cnpj, filial]);
      
      const unidadeId = resUnidade.rows[0].id;
      const pgrAno = row['PGR'];
      const pgrLista = row['LISTA CARE PLUS'];
      
      if (pgrAno && pgrLista) {
        await query(`
          INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
          VALUES ($1, 'PGR', $2, $3, 'Vigente')
        `, [unidadeId, pgrAno.toString(), pgrLista.toString()]);
      }
    }

    // Process DESMOBILIZADOS
    for (const row of desmobilizadoData) {
      const cnpj = row['CNPJ']?.toString().trim();
      if (!cnpj) continue;
      
      await query(`
        UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = $1
      `, [cnpj]);
    }

    await query('COMMIT');
    console.log("Banco atualizado com sucesso!");
    console.log(`Estatísticas extraídas:`);
    console.log(`Total Lojas: ${totalLojas}`);
    console.log(`Total Prédios: ${totalPredios}`);
    console.log(`Total Escopo ISO: ${totalIso}`);
    console.log(`Total DGs: ${totalDgs}`);
  } catch (err) {
    await query('ROLLBACK');
    console.error("Erro na atualização do banco:", err);
  }
}

run().catch(console.error);
