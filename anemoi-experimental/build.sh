#!/bin/bash

set -e

# Use latest modules 
# check if the below is up to date and necessary
module use /appl/local/training/modules/AI-20240529
module load LUMI/24.03 cotainr

CONTAINER=anemoi_lam #anemoi_std
# Directories
d_WORK=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
d_CONDATOOLS=/scratch/project_465001235/vandenbl/containers/tools/Conda-Tools
d_CONT=/scratch/project_465001235

printf -v date '%(%Y%m%d)T'

# Files
f_ENV=$CONTAINER-recipe.yml
f_BASE=lumi-rocm-rocm-5.6.1.sif
f_SIF=${CONTAINER}_${date}.sif
f_INST=${CONTAINER}_${date}-installed.yml

cd $d_WORK

# Remove previous container
rm -f $f_SIF
echo "let's build a container"

cotainr build $f_SIF --base-image=$f_BASE --conda-env=$f_ENV --accept-licenses

echo 'container finished'

echo 'inspecting what we have build'
CMD="python ${d_CONDATOOLS}/conda_export.py --from-history --use-versions -o $f_INST"
singularity exec -B $d_CONT $f_SIF bash -c "$CMD"

echo 'output written to '$f_INST