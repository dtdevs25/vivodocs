import pandas as pd
import numpy as np
import sys

file_path = r"c:\Users\Daniel\Desktop\Sistemavivo\CONTROLE PGR_2026_V4.xlsx"
sql_output = r"c:\Users\Daniel\Desktop\Sistemavivo\update_vivodocs_v2.sql"

try:
    xls = pd.ExcelFile(file_path)
except Exception as e:
    print(f"Error opening Excel: {e}")
    sys.exit(1)

def safe(val):
    if val is None or (isinstance(val, float) and np.isnan(val)):
        return ''
    return str(val).strip().replace("'", "''")

sql_commands = []
sql_commands.append("BEGIN;\n")

# --- GERAL ---
total_lojas = 0
total_predios = 0
total_iso = 0

if 'GERAL' in xls.sheet_names:
    df_geral = pd.read_excel(file_path, sheet_name='GERAL')
    df_geral = df_geral.replace({np.nan: None})
    for _, row in df_geral.iterrows():
        cnpj = safe(row.get('CNPJ'))
        if not cnpj:
            continue

        unidade = safe(row.get('UNIDADE'))
        if unidade == 'Loja': total_lojas += 1
        elif 'Pr' in unidade: total_predios += 1

        iso_val = safe(row.get('ISO 45001')).upper()
        is_iso = iso_val == 'ESCOPO ISO'
        if is_iso: total_iso += 1

        filial  = safe(row.get('FILIAL'))
        cidade  = safe(row.get('CIDADE'))
        uf      = safe(row.get('UF'))
        bairro  = safe(row.get('BAIRRO'))
        endereco = safe(row.get('ENDEREÇO'))
        regional = safe(row.get('REGIONAL'))

        sql = f"""INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, escopo_iso_45001, status_funcionamento, is_dg)
VALUES ('{cnpj}', '{filial}', '{unidade}', '{cidade}', '{uf}', '{bairro}', '{endereco}', {str(is_iso).lower()}, 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  escopo_iso_45001 = EXCLUDED.escopo_iso_45001,
  status_funcionamento = 'ATIVA',
  is_dg = false;\n"""
        sql_commands.append(sql)

        # PGR doc
        pgr_lista = safe(row.get('PGR LISTA'))
        pgr_rev = row.get('REVISÃO ')
        if pgr_lista:
            rev_date = pd.to_datetime(pgr_rev, errors='coerce') if pgr_rev else None
            if rev_date is not None and not pd.isnull(rev_date):
                venc_year = rev_date.year + (3 if is_iso else 2)
                venc_date = rev_date.replace(year=venc_year)
                sql_doc = f"""INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '{venc_year}', '{pgr_lista}', 'Vigente', '{rev_date.strftime('%Y-%m-%d')}', '{venc_date.strftime('%Y-%m-%d')}'
FROM unidades WHERE cnpj = '{cnpj}';\n"""
            else:
                sql_doc = f"""INSERT INTO documentos_sst (unidade_id, tipo_documento, lista_entrega, status)
SELECT id, 'PGR', '{pgr_lista}', 'Vigente'
FROM unidades WHERE cnpj = '{cnpj}';\n"""
            sql_commands.append(sql_doc)

        # LTCAT doc
        ltcat_lista = safe(row.get('LTCAT LISTA'))
        ltcat_ano   = row.get('LTCAT')
        if ltcat_lista:
            try:
                ano_val = str(int(ltcat_ano)) if ltcat_ano and pd.notnull(ltcat_ano) else None
            except (ValueError, TypeError):
                ano_val = None
            ano_insert = f"'{ano_val}'" if ano_val else 'NULL'
            sql_doc = f"""INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'LTCAT', {ano_insert}, '{ltcat_lista}', 'Vigente'
FROM unidades WHERE cnpj = '{cnpj}';\n"""
            sql_commands.append(sql_doc)

        # AEP doc
        aep_lista = safe(row.get('AEP LISTA'))
        aep_ano   = row.get('AEP')
        if aep_lista:
            try:
                ano_val = str(int(aep_ano)) if aep_ano and pd.notnull(aep_ano) else None
            except (ValueError, TypeError):
                ano_val = None
            ano_insert = f"'{ano_val}'" if ano_val else 'NULL'
            sql_doc = f"""INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'AET', {ano_insert}, '{aep_lista}', 'Vigente'
FROM unidades WHERE cnpj = '{cnpj}';\n"""
            sql_commands.append(sql_doc)

# --- DGs --- Each row is a separate address, gets its own unit with unique CNPJ suffix
total_dgs = 0
if 'DGs' in xls.sheet_names:
    df_dgs = pd.read_excel(file_path, sheet_name='DGs')
    df_dgs = df_dgs.replace({np.nan: None})
    seen_dg = {}
    for _, row in df_dgs.iterrows():
        base_cnpj = safe(row.get('CNPJ')).split(' -')[0].strip()
        if not base_cnpj:
            continue

        # Make unique CNPJ per address if duplicated
        if base_cnpj not in seen_dg:
            seen_dg[base_cnpj] = 0
            unique_cnpj = base_cnpj
        else:
            seen_dg[base_cnpj] += 1
            parts = base_cnpj.split('-')
            if len(parts) == 2:
                unique_cnpj = f"{parts[0]}-{seen_dg[base_cnpj]:02d}"
            else:
                unique_cnpj = f"{base_cnpj}-{seen_dg[base_cnpj]:02d}"
        total_dgs += 1

        filial   = safe(row.get('Nome da Empresa')) or 'DG Telefonica'
        endereco = safe(row.get('Endereço Comercial') or row.get('Endere\u00e7o Comercial'))
        bairro   = safe(row.get('Bairro'))
        cidade   = safe(row.get('Cidade'))
        uf       = safe(row.get('UF'))
        regional = safe(row.get('Regional'))

        sql = f"""INSERT INTO unidades (cnpj, filial, tipo_predio, cidade, uf, bairro, endereco, status_funcionamento, is_dg)
VALUES ('{unique_cnpj}', '{filial}', 'DG', '{cidade}', '{uf}', '{bairro}', '{endereco}', 'ATIVA', true)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  cidade = EXCLUDED.cidade,
  uf = EXCLUDED.uf,
  bairro = EXCLUDED.bairro,
  endereco = EXCLUDED.endereco,
  is_dg = true,
  status_funcionamento = 'ATIVA';\n"""
        sql_commands.append(sql)

        pgr_ano   = safe(row.get('PGR'))
        pgr_lista = safe(row.get('LISTA CARE PLUS'))
        pgr_emiss = row.get('Data de\nEmissão PGR') or row.get('Data de\nEmiss\u00e3o PGR')
        pgr_venc  = row.get('Vencimento PGR')
        situacao  = safe(row.get('Situação') or row.get('Situa\u00e7\u00e3o'))

        if pgr_lista:
            emiss_date = pd.to_datetime(pgr_emiss, errors='coerce') if pgr_emiss else None
            venc_date  = pd.to_datetime(pgr_venc, errors='coerce') if pgr_venc else None
            if emiss_date and not pd.isnull(emiss_date) and venc_date and not pd.isnull(venc_date):
                sql_doc = f"""INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status, data_revisao, data_vencimento)
SELECT id, 'PGR', '{pgr_ano}', '{pgr_lista}', '{situacao}', '{emiss_date.strftime('%Y-%m-%d')}', '{venc_date.strftime('%Y-%m-%d')}'
FROM unidades WHERE cnpj = '{unique_cnpj}';\n"""
            else:
                sql_doc = f"""INSERT INTO documentos_sst (unidade_id, tipo_documento, ano, lista_entrega, status)
SELECT id, 'PGR', '{pgr_ano}', '{pgr_lista}', '{situacao}'
FROM unidades WHERE cnpj = '{unique_cnpj}';\n"""
            sql_commands.append(sql_doc)

# --- TECHS ---
total_techs = 0
if 'TECHS' in xls.sheet_names:
    df_techs = pd.read_excel(file_path, sheet_name='TECHS')
    df_techs = df_techs.replace({np.nan: None})
    seen_tech = {}
    for _, row in df_techs.iterrows():
        base_cnpj = safe(row.get('CNPJ')).strip()
        if not base_cnpj:
            continue
        
        if base_cnpj not in seen_tech:
            seen_tech[base_cnpj] = 0
            unique_cnpj = base_cnpj
        else:
            seen_tech[base_cnpj] += 1
            parts = base_cnpj.split('-')
            if len(parts) == 2:
                unique_cnpj = f"{parts[0]}-{seen_tech[base_cnpj]:02d}"
            else:
                unique_cnpj = f"{base_cnpj}-{seen_tech[base_cnpj]:02d}"
                
        total_techs += 1
        filial = safe(row.get('Empresa')) or 'TECH'
        uf = safe(row.get('UF'))
        
        sql = f"""INSERT INTO unidades (cnpj, filial, tipo_predio, uf, status_funcionamento, is_dg)
VALUES ('{unique_cnpj}', '{filial}', 'TECH', '{uf}', 'ATIVA', false)
ON CONFLICT (cnpj) DO UPDATE SET
  filial = EXCLUDED.filial,
  tipo_predio = EXCLUDED.tipo_predio,
  uf = EXCLUDED.uf,
  status_funcionamento = 'ATIVA',
  is_dg = false;\n"""
        sql_commands.append(sql)

# --- DESMOBILIZADO ---
if 'DESMOBILIZADO' in xls.sheet_names:
    df_des = pd.read_excel(file_path, sheet_name='DESMOBILIZADO')
    df_des = df_des.replace({np.nan: None})
    for _, row in df_des.iterrows():
        cnpj = safe(row.get('CNPJ'))
        if not cnpj:
            continue
        sql = f"UPDATE unidades SET status_funcionamento = 'DESMOBILIZADA' WHERE cnpj = '{cnpj}';\n"
        sql_commands.append(sql)

sql_commands.append("COMMIT;\n")

with open(sql_output, 'w', encoding='utf-8') as f:
    f.writelines(sql_commands)

print(f"Estatisticas:")
print(f"  Lojas: {total_lojas}")
print(f"  Predios: {total_predios}")
print(f"  DGs: {total_dgs}")
print(f"  TECHS: {total_techs}")
print(f"  Escopo ISO: {total_iso}")
print(f"SQL escrito em: {sql_output}")
