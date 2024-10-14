# Setting up the anemoi-lam containter on LUMI
This document describes how the `anemoi-lam` container for use on LUMI was created.

After the LUMI-upgrade of 2024-09 the AMD-drivers on LUMI now support ROCm `v6.2.*`. 
Base containers with ROCm can be found in `/appl/local/containers/sif-images`.  
This `anemoi-lam` container uses `lumi-rocm-rocm-6.2.0.sif` as base-image.

In this container the [`feature/limited_area_crop`](https://github.com/dietervdb-meteo/anemoi-training/tree/feature/limited_area_crop) branch of `anemoi-training` is installed.  

This branch of `anemoi-training` depends on the [`feature/support-forcing-area-in-cutout`](https://github.com/ecmwf/anemoi-graphs/tree/feature/support-forcing-area-in-cutout) branch of `anemoi-graphs`.
We have chosen not to pin the commit hashes, so be aware that rebuiling the container might introduce newer versions of `anemoi-training` and `anemoi-graphs`!

All dependencies were first installed without version specifications and all versions were pinned a-posteriori in the `.yaml`-file.

## Issues
This container does not include [`flash-attn`](https://github.com/Dao-AILab/flash-attention) as for now I have not been able to include it through the `cotainr` installation procedure (ticket has been created with user-support)

