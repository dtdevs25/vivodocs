import pandas as pd
import json

file_path = "CONTROLE PGR_2026_V4.xlsx"
try:
    xl = pd.ExcelFile(file_path)
    sheet_name = 'FINANCEIRO '
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    print("Columns in", sheet_name, ":", df.columns.tolist())
    print("First 3 rows:")
    print(df.head(10).to_string())
except Exception as e:
    print(f"Error: {e}")
