#!/bin/bash

# Download the dataset zip file **THIS MIGHT NOT WORK BECAUZE OF AUTHENTICATION AND API KEYS**
curl -L -o ~/Downloads/nyc-taxi-dataset.zip\
  https://www.kaggle.com/api/v1/datasets/download/microize/nyc-taxi-dataset

# Unzip the zip file to create a directory for analysis
# INSERT PYTHON SCRIPT CALL HERE -- Need to define zip_file path and output_file path
python unzip.py zip_file output_file
