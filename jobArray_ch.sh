#!/bin/bash

# Get year
YEAR=$(sed -n "${1}p" years.txt)
echo "Processing year: $YEAR"

# Run compute_fare.py
singularity exec \
  --bind "$PWD":/mnt \
  --bind /staging/groups/stat_dscp/my_group03/Dataset:/data \
  /staging/groups/stat_dscp/my_group03/python_ds.sif \
  python3 /mnt/compute_fare.py "$YEAR"

echo "Done processing year: $YEAR"
