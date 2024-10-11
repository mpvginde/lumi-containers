#!/bin/bash

set -e

# Use latest modules 
# might not be necessary anymore after service session end of August 2024
module purge
module use /appl/local/training/modules/AI-20240529
module load LUMI/24.03 cotainr/2023.11.0.1-cray-python-3.9.13.1


CONTAINER=anemoi-lam
# Directories
d_WORK=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Files
f_ENV=$CONTAINER.yml
f_BASE=lumi-rocm-rocm-6.2.0.sif
f_SIF=$CONTAINER.sif

cd $d_WORK

# Remove previous container
rm -f $f_SIF

cotainr build $f_SIF --base-image=$f_BASE --conda-env=$f_ENV --accept-licenses
