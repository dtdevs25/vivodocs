import pandas as pd
import psycopg2
import os

db_url = os.environ.get('DATABASE_URL', 'postgresql://postgres:a622e0d57488ec94@srv-captain--postgres:5432/db_vivodocs')
file_path = "CONTROLE PGR_2026_V4.xlsx"
sheet_name = 'FINANCEIRO '

try:
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    
    # Extract unit values
    unit_values = {}
    for idx, row in df.iterrows():
        if pd.notna(row.iloc[0]) and isinstance(row.iloc[0], str):
            serv = row.iloc[0].strip()
            if serv in ['PGR', 'LTCAT', 'AET', 'PERIC', 'INSALUB']:
                val = row.iloc[1]
                if pd.notna(val) and isinstance(val, (int, float)):
                    unit_values[serv] = val
                    
    # Find columns that have Month/List header in Row 0
    records = []
    for col_idx in range(2, len(df.columns), 2):
        header = df.iloc[0, col_idx]
        if pd.isna(header):
            continue
            
        lista_lote = str(header).strip()
        
        # Get quantities for this month
        qt_pgr = df.iloc[2, col_idx]
        qt_ltcat = df.iloc[3, col_idx]
        qt_aet = df.iloc[6, col_idx]
        
        qt_pgr = 0 if pd.isna(qt_pgr) or not isinstance(qt_pgr, (int, float)) else int(qt_pgr)
        qt_ltcat = 0 if pd.isna(qt_ltcat) or not isinstance(qt_ltcat, (int, float)) else int(qt_ltcat)
        qt_aet = 0 if pd.isna(qt_aet) or not isinstance(qt_aet, (int, float)) else int(qt_aet)
        
        # Get total
        total = df.iloc[7, col_idx + 1]
        total = 0 if pd.isna(total) or not isinstance(total, (int, float)) else float(total)
        
        # Date text
        date_text = df.iloc[8, col_idx]
        just = df.iloc[9, col_idx]
        
        justificativa = ""
        if pd.notna(date_text):
            justificativa += str(date_text) + ". "
        if pd.notna(just):
            justificativa += str(just)
            
        if qt_pgr > 0 or qt_ltcat > 0 or qt_aet > 0 or total > 0:
            records.append({
                'lista_lote': lista_lote,
                'justificativa': justificativa,
                'qtd_pgr': qt_pgr,
                'valor_unit_pgr': unit_values.get('PGR', 839.8),
                'qtd_ltcat': qt_ltcat,
                'valor_unit_ltcat': unit_values.get('LTCAT', 850.0),
                'qtd_aet': qt_aet,
                'valor_unit_aet': unit_values.get('AET', 836.1),
                'qtd_aep': 0,
                'valor_unit_aep': 0,
                'qtd_insalubridade': 0,
                'valor_unit_insalubridade': 0,
                'desconto': 0, # Assuming 0 for now
                'valor_total': total
            })
            
    print(f"Found {len(records)} records to insert.")
    
    conn = psycopg2.connect(db_url)
    cur = conn.cursor()
    
    # First clear existing faturamento records to avoid duplicates? Or just insert? Let's clear for testing
    cur.execute("DELETE FROM faturamento;")
    
    for r in records:
        cur.execute("""
            INSERT INTO faturamento (
                lista_lote, justificativa, 
                qtd_pgr, valor_unit_pgr, 
                qtd_ltcat, valor_unit_ltcat, 
                qtd_aep, valor_unit_aep, 
                qtd_aet, valor_unit_aet, 
                qtd_insalubridade, valor_unit_insalubridade, 
                desconto, valor_total
            ) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
        """, (
            r['lista_lote'], r['justificativa'],
            r['qtd_pgr'], r['valor_unit_pgr'],
            r['qtd_ltcat'], r['valor_unit_ltcat'],
            r['qtd_aep'], r['valor_unit_aep'],
            r['qtd_aet'], r['valor_unit_aet'],
            r['qtd_insalubridade'], r['valor_unit_insalubridade'],
            r['desconto'], r['valor_total']
        ))
        
    conn.commit()
    cur.close()
    conn.close()
    print("Done inserting faturamento data.")
except Exception as e:
    print(f"Error: {e}")
