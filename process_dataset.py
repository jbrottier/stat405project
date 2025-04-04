import pandas as pd
import sys
from pathlib import Path

# This function reads all the parquet files in the given file_paths and combines them into a single dataframe
def read_data(file_paths):
    dfs = []
    for fp in file_paths:
        try:
            df = pd.read_parquet(fp)
            print(f"Reading {fp}")
            dfs.append(df)
        except Exception as e:
            print(f"Error reading {fp}: {e}")
    # Combine all dataframes together and return an empty df if there are errors or no data
    if len(dfs) != 0:
        combined_df = pd.concat(dfs, ignore_index=True)
        return combined_df
    else:
        return pd.DataFrame()

# This function processes all the files from a specific year and subfolder (transportation type)
def process_year(yf, subfolder, out):
    yp = Path(yf)
    # Checks to see if the year path exists and is a directory containing files
    if yp.exists() and yp.is_dir():
        folder_path = yp / subfolder
        # Checks to see if the folder path exists and is a directory containing files
        if folder_path.exists() and folder_path.is_dir():
            # Get all files for each month in the folder
            parquet_files = list(folder_path.glob('*.parquet'))
            # Combine files into a single dataframe
            combined_df = read_data(parquet_files)
            # Save the combined dataframe to a CSV file
            if not combined_df.empty:
                combined_df.to_csv(out, mode='a', index=False, header=not Path(out).exists())
                print(f"Saved combined data to {out}")
            else:
                print(f"No data to combine for {subfolder} in {yf}")

# This function processes the data for a specific year
def process_dataset(output_folder, year):
    # Defining transportation methods
    subfolders = ["for_hire_vehicle", "green_taxi", "high_volume_for_hire_vehicle", "yellow_taxi"]
    
    yf = output_folder / str(year)
    
    for sf in subfolders:
        # Define the output file for each subfolder
        output_file = output_folder / f"{sf}_combined_data_{year}.csv"
        process_year(yf, sf, output_file)

# Getting the arguments for the script when it is run
if __name__ == "__main__":
    # Folder to unzip the data to (this is the output folder where data was unzipped)
    output_folder = Path(sys.argv[1])
    # Year to process (from 2009 to 2023)
    year = int(sys.argv[2])
    
    # Processes the data for the specified year
    process_dataset(output_folder, year)
