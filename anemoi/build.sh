#!/bin/bash

set -e

# Use latest modules 
# might not be necessary anymore after service session end of August 2024
module purge
module use /appl/local/training/modules/AI-20241126
module load LUMI/24.03 cotainr/2023.11.0-20240909


CONTAINER=anemoi
# Directories
d_WORK=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
d_BASE=$d_WORK/../base-containers

# Files
f_ENV=$CONTAINER.yml
f_BASE=lumi-rocm-rocm-6.0.3.sif
f_SIF=${CONTAINER}.sif

cd $d_WORK

# Remove previous container
rm -f $f_SIF

cotainr build $f_SIF --base-image=$d_BASE/$f_BASE --conda-env=$f_ENV --accept-licenses
