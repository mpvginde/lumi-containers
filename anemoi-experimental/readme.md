# A first anemoi container on LUMI

The container is build from a conda environment in which we simply pip install the relevant version of anemoi-training. This calls all other anemoi packages as well as the required python packages outside anemoi. The only catch is that standard anemoi is configured towards NVIDIA GPU's, while on LUMI we are on AMD GPU's. For this reason we manually insert the installation of the required ROCm versions of pytorch. 

The build script includes a diagnosis of the installed packages after the container is finished. The container is build from `anemoi-recipe.yml`, the actual packages installed can be found in `anemoi-installed.yml`.


### Open issues
- fix GPU monitorin ala aifs-mono container
- At some point we should be able to move to `>= torch 2.3` since LUMI now supports ROCm 6.0.3. But `/appl/local/containers/sif-images/` contains no pre-build ROCm 6.0.3 container yet. [20/09/2024]

