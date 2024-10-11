# Setting up the anemoi-lam containter on LUMI
This document describes how the `anemoi-lam` container for use on LUMI was created.

After the LUMI-upgrade of 2024-09 the AMD-drivers on LUMI now support ROCm `v6.2.*`. 
Base containers with ROCm can be found in `/appl/local/containers/sif-images`.  
This `anemoi-lam` container uses `lumi-rocm-rocm-6.2.0.sif` as base-image.

In this container the [`feature/limited_area`](https://github.com/ecmwf/anemoi-training/tree/feature/limited_area) branch of `anemoi-training` is installed.  

More specifically we have pinned the commit hash [`09fd1e`](https://github.com/ecmwf/anemoi-training/commit/09fd1e2987b4682f26d52ed16797fa20314ccf2c).

This branch of `anemoi-training` depends on the [`feature/8-stretched-grid-graphs`](https://github.com/ecmwf/anemoi-graphs/tree/feature/8-stretched-grid-graphs) branch of `anemoi-graphs`. Pinning the commit hash here was not possible as it gave conflicts with the dependencies of `anemoi-training`.  
Be aware that rebuiling the container might thus introduce newer versions of `anemoi-graphs`!

All dependencies were first installed without version specifications and all versions were pinned a-posteriori in the `.yaml`-file.

## Issues
This container does not include [`flash-attn`](https://github.com/Dao-AILab/flash-attention) as for now I have not been able to include it through the `cotainr` installation procedure (ticket has been created with user-support)

