import pandas as pd
import numpy as np
import sys

file_path = r"c:\Users\Daniel\Desktop\Sistemavivo\CONTROLE PGR_2026_V4.xlsx"
sql_output = r"c:\Users\Daniel\Desktop\Sistemavivo\update_vivodocs.sql"

try:
    xls = pd.ExcelFile(file_path)
except Exception as e:
    print(f"Error opening Excel: {e}")
    sys.exit(1)

total_lojas = 0
total_predios = 0
total_dgs = 0
total_iso = 0

sql_commands = []
sql_commands.append("BEGIN;\n")

# Process GERAL
if 'GERAL' in xls.sheet_names:
    df_geral = pd.read_excel(file_path, sheet_name='GERAL')
    df_geral = df_geral.replace({np.nan: None})
    for _, row in df_geral.iterrows():
        cnpj = str(row.get('CNPJ', '')).strip()
        if not cnpj or cnpj == 'None':
            continue
        
        unidade = str(row.get('UNIDADE', '')).strip()
        if unidade == 'Loja': total_lojas += 1
        if unidade.startswith('Pr'): total_predios += 1
        
        iso_val = str(row.get('ISO 45001', '')).strip()
        is_iso = True if iso_val == 'ESCOPO ISO' else False
        if is_iso: total_iso += 1
        
        filial = str(row.get('FILIAL', '')).strip().replace("'", "''")
        cidade = str(row.get('CIDADE', '')).strip().replace("'", "''")
        uf = str(row.get('UF', '')).strip().replace("'", "''")
        bairro = str(row.get('BAIRRO', '')).strip().replace("'", "''")
        endereco = str(row.get('ENDEREÇO', '')).strip().replace("'", "''")
        
        # Upsert unit
        sql = f"""
INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento)
VALUES ('{cnpj}', '{filial if filial != 'None' else ''}', '{unidade if unidade != 'None' else ''}', '{cidade if cidade != 'None' else ''}', '{uf if uf != 'None' else ''}', '{bairro if bairro != 'None' else ''}', '{endereco if endereco != 'None' else ''}', {str(is_iso).lower()}, 'ATIVA')
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA';
"""
        sql_commands.append(sql)
        
        # Docs - PGR
        pgr_lista = row.get('PGR LISTA') or row.get('LISTA ')
        pgr_rev = row.get('REVISÃO ')
        
        if pgr_lista and pgr_lista != 'None':
            if pgr_rev and pd.notnull(pgr_rev):
                rev_date = pd.to_datetime(pgr_rev, errors='coerce')
                if not pd.isnull(rev_date):
                    venc_year = rev_date.year + (3 if is_iso else 2)
                    venc_date = rev_date.replace(year=venc_year)
                    sql_doc = f"""
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '{venc_year}', '{pgr_lista}', 'Vigente', '{rev_date.strftime('%Y-%m-%d')}', '{venc_date.strftime('%Y-%m-%d')}'
FROM unidades WHERE cnpj = '{cnpj}';
"""
                    sql_commands.append(sql_doc)
            else:
                sql_doc = f"""
INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega)
SELECT id, 'PGR', '{pgr_lista}'
FROM unidades WHERE cnpj = '{cnpj}';
"""
                sql_commands.append(sql_doc)

        # LTCAT
        ltcat_lista = row.get('LTCAT LISTA') or row.get('LTCAT')
        ltcat_ano = row.get('ANO LTCAT')
        if ltcat_lista and ltcat_lista != 'None':
            ano_val = str(int(ltcat_ano)) if pd.notnull(ltcat_ano) else 'NULL'
            ano_insert = f"'{ano_val}'" if ano_val != 'NULL' else "NULL"
            sql_doc = f"""
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', {ano_insert}, '{ltcat_lista}', 'Vigente'
FROM unidades WHERE cnpj = '{cnpj}';
"""
            sql_commands.append(sql_doc)

        # AEP
        aep_lista = row.get('AEP LISTA') or row.get('AEP')
        aep_ano = row.get('ANO AEP')
        if aep_lista and aep_lista != 'None':
            ano_val = str(int(aep_ano)) if pd.notnull(aep_ano) else 'NULL'
            ano_insert = f"'{ano_val}'" if ano_val != 'NULL' else "NULL"
            sql_doc = f"""
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AEP', {ano_insert}, '{aep_lista}', 'Vigente'
FROM unidades WHERE cnpj = '{cnpj}';
"""
            sql_commands.append(sql_doc)

# DGs
if 'DGs' in xls.sheet_names:
    df_dgs = pd.read_excel(file_path, sheet_name='DGs')
    df_dgs = df_dgs.replace({np.nan: None})
    for _, row in df_dgs.iterrows():
        cnpj = str(row.get('CNPJ', '')).strip()
        if not cnpj or 'DG' not in cnpj:
            continue
        total_dgs += 1
        
        filial = str(row.get('Nome da Empresa', '')).strip().replace("'", "''")
        
        sql = f"""
INSERT INTO unidades (cnpj, filial, tipo_predio, status_funcionamento, is_dg)
VALUES ('{cnpj}', '{filial}', 'DG', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  is_dg = true,
  status_funcionamento = 'ATIVA';
"""
        sql_commands.append(sql)
        
        pgr_ano = row.get('PGR')
        pgr_lista = row.get('LISTA CARE PLUS')
        if pgr_ano and pgr_lista and pgr_ano != 'None':
            sql_doc = f"""
INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'PGR', '{pgr_ano}', '{pgr_lista}', 'Vigente'
FROM unidades WHERE cnpj = '{cnpj}';
"""
            sql_commands.append(sql_doc)

# DESMOBILIZADO
if 'DESMOBILIZADO' in xls.sheet_names:
    df_des = pd.read_excel(file_path, sheet_name='DESMOBILIZADO')
    df_des = df_des.replace({np.nan: None})
    for _, row in df_des.iterrows():
        cnpj = str(row.get('CNPJ', '')).strip()
        if not cnpj or cnpj == 'None':
            continue
        # Excluir o com CEP no lugar de NR20 conforme prompt
        nr20 = str(row.get('NR20', '')).strip()
        if nr20 == '72010-010':
            continue
            
        sql = f"""
UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '{cnpj}';
"""
        sql_commands.append(sql)

sql_commands.append("COMMIT;\n")

with open(sql_output, 'w', encoding='utf-8') as f:
    f.writelines(sql_commands)

print(f"Estatisticas geradas a partir da planilha:")
print(f"Lojas: {total_lojas}")
print(f"Predios: {total_predios}")
print(f"DGs: {total_dgs}")
print(f"Escopo ISO: {total_iso}")
print(f"SQL file written to {sql_output}")
