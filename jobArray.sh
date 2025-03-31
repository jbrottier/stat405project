#!/bin/bash

# Setting the year based on the specified array
year=$(($SLURM_ARRAY_TASK_ID + 2008))

echo "Processing year $year..."

# Procoess the specified year using the created python script
python process_dataset.py $1 $year
