#!/bin/bash

# Get the current directory to download the data and create data directory
dir="$1"
mkdir -p "$dir/data"

# Define zip file and output folder for python script
zip="$dir/data/nyc-taxi-dataset.zip"
output="$dir/data"

# Download the dataset zip file **THIS MIGHT NOT WORK BECAUSE OF AUTHENTICATION AND API KEYS**
curl -L -o "$zip" \
  https://www.kaggle.com/api/v1/datasets/download/microize/nyc-taxi-dataset

# Unzip the zip file to create a directory for analysis
python unzip.py "$zip" "$output"

