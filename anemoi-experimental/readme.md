# A first anemoi container on LUMI

The container is build from a conda environment in which we simply pip install the relevant version of anemoi-training (or inference+ai-models). This calls all other anemoi packages as well as the required python packages outside anemoi. The only catch is that standard anemoi is configured towards NVIDIA GPU's, while on LUMI we are on AMD GPU's. For this reason we manually insert the installation of the required ROCm versions of pytorch. 

The build script includes a diagnosis of the installed packages after the container is finished. The container is build from `anemoi_???-recipe.yml`, the actual packages installed can be found in `anemoi_???-installed.yml`. Currently there are three versions
-anemoi_lam : specific versions of graph and training for lam support
-anemoi_std : standard training branch (currently only supports global model)
-anemoi_inf : container to do inference



### Open issues
- fix GPU monitoring ala aifs-mono container

