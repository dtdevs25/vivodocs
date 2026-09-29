const xlsx = require('./backend/node_modules/xlsx');
const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'CONTROLE PGR_2026_V4.xlsx');
const workbook = xlsx.readFile(filePath);

let sql = '';

const escapeSql = (str) => {
  if (str === null || str === undefined) return 'NULL';
  return "'" + String(str).replace(/'/g, "''") + "'";
};

// Aba GERAL -> unidades_ativas
const sheetGeral = workbook.Sheets['GERAL'];
if (sheetGeral) {
  const data = xlsx.utils.sheet_to_json(sheetGeral, { header: 1 });
  const rows = data.slice(1).filter(r => r[0]); // Pular header, garantir que tem CNPJ

  for (const r of rows) {
    const cnpj = String(r[0] || '').trim();
    if (!cnpj) continue;
    
    const escopo_iso = String(r[1] || '').trim().toUpperCase() === 'SIM' ? 'TRUE' : 'FALSE';
    const filial = String(r[11] || '');
    const tipo_predio = String(r[12] || '');
    const uf = String(r[13] || '');
    const cidade = String(r[14] || '');
    const bairro = String(r[15] || '');
    const endereco = String(r[16] || '');
    const regional = String(r[17] || '');
    const nr20 = String(r[18] || '').trim().toUpperCase() === 'SIM' ? 'TRUE' : 'FALSE';
    const mes_ano_po = String(r[19] || '');
    const observacoes = String(r[20] || '');

    sql += `INSERT INTO unidades_ativas (cnpj, filial, tipo_predio, regional, uf, cidade, bairro, endereco, escopo_iso_45001, nr_20, mes_ano_po, observacoes) `;
    sql += `VALUES (${escapeSql(cnpj)}, ${escapeSql(filial)}, ${escapeSql(tipo_predio)}, ${escapeSql(regional)}, ${escapeSql(uf)}, ${escapeSql(cidade)}, ${escapeSql(bairro)}, ${escapeSql(endereco)}, ${escopo_iso}, ${nr20}, ${escapeSql(mes_ano_po)}, ${escapeSql(observacoes)}) `;
    sql += `ON CONFLICT (cnpj) DO NOTHING;\n`;
    
    // PGR
    if (r[2] || r[3]) {
      sql += `INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega) `;
      sql += `SELECT id, 'PGR', ${escapeSql(r[2])}, ${escapeSql(r[3])} FROM unidades_ativas WHERE cnpj = ${escapeSql(cnpj)};\n`;
    }
    // LTCAT
    if (r[4] || r[5]) {
      sql += `INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega) `;
      sql += `SELECT id, 'LTCAT', ${escapeSql(r[4])}, ${escapeSql(r[5])} FROM unidades_ativas WHERE cnpj = ${escapeSql(cnpj)};\n`;
    }
    // AEP
    if (r[6] || r[7]) {
      sql += `INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega) `;
      sql += `SELECT id, 'AEP', ${escapeSql(r[6])}, ${escapeSql(r[7])} FROM unidades_ativas WHERE cnpj = ${escapeSql(cnpj)};\n`;
    }
  }
}

// Aba DESMOBILIZADO -> unidades_desmobilizadas
const sheetDesmob = workbook.Sheets['DESMOBILIZADO'];
if (sheetDesmob) {
  const data = xlsx.utils.sheet_to_json(sheetDesmob, { header: 1 });
  const rows = data.slice(1).filter(r => r[1]); // CNPJ está na coluna 1 (índice 1)

  for (const r of rows) {
    const cnpj = String(r[1] || '').trim();
    if (!cnpj) continue;

    const filial = String(r[10] || '');
    const uf = String(r[12] || '');
    const cidade = String(r[13] || '');
    const regional = String(r[18] || '');
    const obs = String(r[21] || '');

    sql += `INSERT INTO unidades_desmobilizadas (cnpj, filial, regional, uf, cidade, motivo_desmobilizacao, data_desmobilizacao) `;
    sql += `VALUES (${escapeSql(cnpj)}, ${escapeSql(filial)}, ${escapeSql(regional)}, ${escapeSql(uf)}, ${escapeSql(cidade)}, ${escapeSql(obs)}, CURRENT_DATE);\n`;
  }
}

// Aba DGs -> distribuidores_gerais_dg
const sheetDgs = workbook.Sheets['DGs'];
if (sheetDgs) {
  const data = xlsx.utils.sheet_to_json(sheetDgs, { header: 1 });
  const rows = data.slice(1).filter(r => r[1]); 

  for (const r of rows) {
    const nome = String(r[0] || '');
    const cnpj = String(r[1] || '');
    const pgr = String(r[2] || '');
    const status = String(r[5] || '');

    sql += `INSERT INTO distribuidores_gerais_dg (nome_empresa, cnpj_dg, status_pgr) `;
    sql += `VALUES (${escapeSql(nome)}, ${escapeSql(cnpj)}, ${escapeSql(status)});\n`;
  }
}

fs.writeFileSync(path.join(__dirname, 'seed_data.sql'), sql);
console.log('SQL generated successfully at seed_data.sql');
