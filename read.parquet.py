import pandas as pd
import sys

def read_parquet(file_path):
  try:
    df = pd.read_parquet(file_path)
    print(f"Reading {file_path}...")
    print(df.head())
  except Exception as e:
    print(f"Error reading {file_path}: {e}")

if __name__ == "__main__":
    file_path = sys.argv[1]
    read_parquet(file_path)
