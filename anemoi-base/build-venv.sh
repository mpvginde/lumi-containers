#!/bin/bash

set -e

# Use latest modules 
# might not be necessary anymore after service session end of August 2024
module purge
module use /appl/local/training/modules/AI-20240529
module load LUMI/24.03
module load singularity-userfilesystems singularity-CPEbits


CONTAINER=anemoi-base

# Directories
d_WORK=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Files
f_REQ=requirements.txt
f_SIF=$CONTAINER.sif

#Location of the virtual environment
d_VENV=/scratch/project_465001235/<user-name>/<venv-name>

cd $d_WORK

command="python3 -m venv ${d_VENV} --system-site-packages;\
    source ${d_VENV}/bin/activate;\
    pip install -r ${f_REQ}"

singularity exec ${f_SIF} bash -c "$command"