import pandas as pd
import json
import sys

file_path = r"c:\Users\Daniel\Desktop\Sistemavivo\CONTROLE PGR_2026_V4.xlsx"
try:
    xls = pd.ExcelFile(file_path)
except Exception as e:
    print(f"Error opening Excel: {e}")
    sys.exit(1)

print(f"Sheet names: {xls.sheet_names}")

for sheet in xls.sheet_names:
    try:
        df = pd.read_excel(file_path, sheet_name=sheet)
        print(f"\n--- Sheet: {sheet} ---")
        print(f"Rows: {len(df)}")
        print(f"Columns: {list(df.columns)}")
        # Print a few rows to understand structure
        print(df.head(2).to_dict(orient='records'))
    except Exception as e:
        print(f"Error reading sheet {sheet}: {e}")
