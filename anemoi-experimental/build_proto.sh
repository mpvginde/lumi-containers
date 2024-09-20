#!/bin/bash

set -e

# Use latest modules 
# check if the below is up to date and necessary
module use /appl/local/training/modules/AI-20240529
module load LUMI/24.03 cotainr

CONTAINER=anemoi-proto-container
# Directories
d_WORK=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Files
f_ENV=$CONTAINER.yml
f_BASE=lumi-rocm-rocm-5.6.1.sif
f_SIF=$CONTAINER.sif

cd $d_WORK

# Remove previous container
rm -f $f_SIF

cotainr build $f_SIF --base-image=$f_BASE --conda-env=$f_ENV --accept-licenses
