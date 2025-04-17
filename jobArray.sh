#!/bin/bash

# Get the Year
year=$1
staging_dir=$2

echo "Processing year $year from $staging_dir..."

# Process with Python
python process_dataset.py "$staging_dir" "$year"
