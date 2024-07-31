# Setting up the AIFS-MONO (hackathon branch) container on LUMI
This document describes how the aifs-mono (hackathon branch) container for use on LUMI was created.

We started from the container provided by Met-Norway. In this container some parts of aifs-mono are installed, but additional installs (using a `venv`) are needed. 
This container can be found here:
```bash
/scratch/project_465001235/vanginde/containers/aifs-mono_hackathon_MetNO.sif
```
From this a *stripped-down* version of the used conda environment was obtained using the `conda_export.py` script found [here](https://github.com/andresberejnoi/Conda-Tools)
The advantage of this script is that:
-  it includes pip installations when using flag `--from-history`
-  When using flag `--from-history`, package versions are included
-  When using `--from-history flag`, third-party channels are included

This results in the conda environmet file: `aifs-mono_hackathon_MetNO_BASIC.yml`
The most important feature of this environment is, that is uses `pytorch` and its derivates compiled against the `ROCm` software stack needed for running on LUMI's AMD GPUs.

This conda environment file was further finetuned to include all dependencies needed for:
- building graphs
- run training
With aifs-mono.

*Some issues needed to be resolved:*
## 1. `torch 2.3` dependency of `anemoi-models/feature/graph_refactored`
Installing the `hackathon` branch of `aifs-mono` triggers the installation of the `feature/graph_refactored` branch of `anemoi-models`.  
This branch however has the strict dependency `torch >= 2.3`, while on LUMI (and thus in our container) only `torch 2.2` is available.  
This in turn triggers a completely new installation of `torch 2.3` which does not take in to accound the `ROCm` software stack.  

To avoid this trigger cascade, both `aifs-mono` and `anemoi-models` are cloned from github and their dependencies are adjusted accordingly.
The src folders or then bind-mounted to the container so they are available during the building of the container.

## 2. Bug in `anemoi-models 0.4.0`  
Using the latest `anemoi-models` version `0.4.0` which replaces `climetlab` by `earthkit` seems to reintroduce a bug in the graph-building previously seen during the kickoff meeting. 
Pinning `anemoi-models` to `0.3.7` seems to resolve the issue

## 3. Error due to serialization of an `np.datetime64`-object  
This seems to be related to the version of `anemoi-utils`. Pinning the version to `0.3.7` resolves the error.

## 4. `aifs-mono` python files are not copied to `site-packages` folder  
When pip installing `aifs-mono`, the actual python files are not copied to the `site-packages` folder.
Since the src folder is only mounted to the container the python files are not part of the container and true portability is lost.  
The copying of the src files is controlled by the `MANIFEST.in` file.  This file is thus adjusted to include all the aifs-mono source files.  
In addition all the config `yaml` files are removed from the `MANIFEST.in` file in order to prevent that users of the container would use the default config-files by accident.

## 5. `mlflow` does not support AMD GPUs
A fix was provided by the MetNO colleagues https://github.com/mlflow/mlflow/pull/12694
So we manually install this mlflow branch

*Some issues still to be resolved:*
## 1. `torch-scatter` not available for `ROCm`
I was not yet able to find a `torch-scatter` version built against the `ROCm` libraries. 
`torch-scatter` was removed from the environment, and it seems `aifs-mono` does not complain. 

## 2. Torch was not compiled with memory efficient attention.
We get the above error when training with `aifs-mono`.  
It seems `torch+rocm` with efficient attention is still a [WIP](https://github.com/pytorch/pytorch/issues/112997)

Automatic building of the container on LUMI can be done with 
```bash
./build.sh
```
