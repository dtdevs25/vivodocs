import pandas as pd
import math
import sys

file_path = r"c:\Users\Daniel\Desktop\Sistemavivo\CONTROLE PGR_2026_V4.xlsx"
try:
    xls = pd.ExcelFile(file_path)
except Exception as e:
    print(f"Error opening Excel: {e}")
    sys.exit(1)

def print_stats():
    print(f"Abas encontradas: {xls.sheet_names}")
    
    # Aba GERAL
    if 'GERAL' in xls.sheet_names:
        df_geral = pd.read_excel(file_path, sheet_name='GERAL')
        print(f"\n--- Aba GERAL ---")
        print(f"Total de linhas: {len(df_geral)}")
        
        # Lojas vs Predios
        if 'UNIDADE' in df_geral.columns:
            unidades_counts = df_geral['UNIDADE'].value_counts(dropna=False)
            print("Tipos de Unidades:")
            print(unidades_counts.to_string())
            
        # ISO
        if 'ISSO' in df_geral.columns:
            iso_counts = df_geral['ISSO'].value_counts(dropna=False)
            print("\nEscopo ISO 45001:")
            print(iso_counts.to_string())
            
    # Aba DGs
    if 'DGs' in xls.sheet_names:
        df_dgs = pd.read_excel(file_path, sheet_name='DGs')
        print(f"\n--- Aba DGs ---")
        print(f"Total de DGs listados: {len(df_dgs)}")

    # Aba DESMOBILIZADO
    if 'DESMOBILIZADO' in xls.sheet_names:
        df_desmob = pd.read_excel(file_path, sheet_name='DESMOBILIZADO')
        print(f"\n--- Aba DESMOBILIZADO ---")
        print(f"Total de unidades desmobilizadas: {len(df_desmob)}")

print_stats()
