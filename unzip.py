import sys
import zipfile
from pathlib import Path

# This function unzips the dataset
def unzip(zf, output):
    with zipfile.ZipFile(zf, 'r') as zip_ref:
        zip_ref.extractall(output)
    print(f'Unzipped {zf} to {output}')

# Getting the arguments for the script when it is run
if __name__ == "__main__":
    # Gets the zip file path (dataset.zip)
    zip_file = sys.argv[1]
    # Folder to unzip the data to
    output_folder = Path(sys.argv[2])

    # Calls the unzip function
    unzip(zip_file, output_folder)
