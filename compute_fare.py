import sys
import pandas as pd

year = sys.argv[1]
file_path = f"/data/yellow_taxi_combined_data_{year}.csv"
out_path = f"/mnt/fares_{year}.txt"


# Read fare_amount column only
try:
    print(f"Reading: {file_path}")
    df = pd.read_csv(file_path, usecols=["fare_amount"])
    avg = df["fare_amount"].mean()
    print(f"Avg: {avg}")
    print(f"writing result to: {out_path}")
    with open(out_path, "w") as f:
        f.write(f"{avg}\n")
except Exception as e:
    print(f"ERROR: {e}")
    with open(out_path, "w") as f:
        f.write(f"ERROR: {e}\n")
