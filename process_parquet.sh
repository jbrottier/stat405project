#!/bin/bash                                                                                                                                                                                          

BASE_DIR="./nyc-taxi-dataset"

for year in {2009..2023}; do
    YEAR_DIR="${BASE_DIR}/${year}"

    if [ -d "$YEAR_DIR" ]; then
        echo "Processing year: $year"

        for subfolder in $(ls "$YEAR_DIR"); do
            SUBFOLDER_PATH="${YEAR_DIR}/${subfolder}"

            if [ -d "$SUBFOLDER_PATH" ]; then
                for file in $(find "$SUBFOLDER_PATH" -name "*.parquet"); do
                    python3 read_parquet.py "$file"
                done
            fi
        done
    fi
done
