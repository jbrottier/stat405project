#!/bin/bash

# Create Directories for Error Handling
rm -rf slurm_out
mkdir slurm_out

# Define the working directory for later use
wd=$(pwd)

# Define the output path for later use
op="$wd/data"

# Enforcing Running order
jobId1=$(sbatch --partition short \
                --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --wrap="bash pre.sh $wd") # Might have to change this based on the file name
jobId1=$(echo $jobId1 | sed 's/Submitted batch job //')

jobId2=$(sbatch --partition short \
                --array=1-15 \
                --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --dependency=afterok:$jobId1 \
                --wrap="bash jobArray.sh $op")
jobId2=$(echo $jobId2 | sed 's/Submitted batch job //')

jobId3=$(sbatch --partition short \
                --output="slurm_out/slurm-%A_%a.out" \
                --error="slurm_out/slurm-%A_%a.err" \
                --dependency=afterok:$jobId2 \
                post.sh) # Might have to change this based on the file name
