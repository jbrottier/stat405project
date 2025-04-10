#!/bin/bash

# Create Output Directory
mkdir -p datasets

# Download Dataset
kaggle datasets download microize/nyc-taxi-dataset -p datasets --unzip
