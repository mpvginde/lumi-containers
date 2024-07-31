#!/bin/bash

set -e

# Use latest modules 
# might not be necessary anymore after service session end of August 2024
module use /appl/local/training/modules/AI-20240529
module load LUMI/23.09 cotainr

CONTAINER=aifs-mono-hackathon
# Directories
d_WORK=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
d_SRC=$d_WORK/src

# Files
f_ENV=$CONTAINER.yml
f_BASE=lumi-rocm-rocm-5.6.1.sif
f_SIF=$CONTAINER.sif


cd $d_WORK
[ -d $d_SRC ] || mkdir -p $d_SRC && rm -rf $d_SRC/*

# We need to clone some source locally because we need to adjust some dependencies
# to make sure there are no conflicts with the packages optimal for LUMI

# Bring correct version of anemoi-models (compatible with hackathon branch of aifs-mono)
git clone -b feature/graph_refactor git@github.com:ecmwf/anemoi-models.git $d_SRC/anemoi-models
cd $d_SRC/anemoi-models
git checkout dc0dc7d 
# Relaxing torch version since our container will use torch 2.2
sed -i "s/torch==2.3/torch<=2.3/g" "pyproject.toml"

# Bring the hackathon branch
cd $d_WORK
git clone -b hackathon git@github.com:ecmwf-lab/aifs-mono.git $d_SRC/aifs-mono
cd $d_SRC/aifs-mono
# Remove some dependencies from aifs-mono since they clash with the ones defined in the environment
sed -i "s/anemoi-datasets\[data\]>=0.3.3/anemoi-datasets>=0.3.3/g" "pyproject.toml"
sed -i "/^[[:space:]]*\"anemoi-models/d" "pyproject.toml"

# Replace the MANIFEST.in file 
# We want to move the aifs-mono package files into the site-packages directory of the container
# If not the files are not included in the container
cat <<EOF > MANIFEST.in
recursive-include aifs *.py
recursive-include aifs *.json
include aifs/*.json
include aifs/*/*.json
include aifs/*/*/*.json
include aifs/*/*/*/*.json
include aifs/*/*/*/*/*.json
include aifs/*/*/*/*/*/*.json
EOF

# Clone the mlflow-branch containing the fix for AMD GPUs
git clone -b amd-statistics git@github.com:evenmn/mlflow.git $d_SRC/mlflow #This should be merged into the main mlflow branch at some point
# An additional bugfix
sed -i "5iimport torch" $d_SRC/mlflow/mlflow/system_metrics/system_metrics_monitor.py

cd $d_WORK
# Remove previous container
rm -f $f_SIF
# Make sure cotainr can see the src directory
export SINGULARITY_BIND=$d_SRC:/mnt
cotainr build $f_SIF --base-image=$f_BASE --conda-env=$f_ENV --accept-licenses
