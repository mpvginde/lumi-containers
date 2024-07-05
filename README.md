# Container Guidelines
This document outlines some guidelines for placing containers in the shared container folder of `project_465001235`.

Please only add **working and thoroughly tested** containers here.  
These containers should be *standalone*, i.e. they should work without loading additional virtual environments.  

For maximum reproducability, each container should be placed in a separate folder containing:
- the container `.sif`-file
- the conda environment `yaml`-file, pinning as much as possible the package versions
- a readme file, briefly explaining what is in the container, specific choices made, problems encountered during building, ...
- a `shell`-script called `build.sh` loading the correct modules (with versions) and including the `cotainr` build command
- the base-image on which the new container is based.

## Example `build.sh` script
```bash
module use /appl/local/training/modules/AI-20240529
module load LUMI/22.08
module load cotainr/2023.11.0.1-cray-python-3.9.13.1

CONTAINER_NAME="my_container.sif"
ENV_FILE="my_environment.yml"
BASE_IMAGE="lumi-rocm-rocm-5.6.1.sif"

# Go to directory of script
cd $( dirname "${BASH_SOURCE[0]}" )

cotainr build ${CONTAINER_NAME} --base-image=${BASE_IMAGE} --accept-licenses --conda-env=${ENV_FILE}

