# anemoi container
This container contains
- stable release versions of torch(vision|audio) 2.5.0 compiled against ROCm 6.2
- stable version of the full anemoi framework that works for Limited Area Training/Inference on LUMI together with 
- most recent versions of the needed dependencies

The following anemoi versions are installed
:::success
anemoi-datasets==0.5.12
anemoi-graphs==0.4.1
anemoi-models==0.4.0
anemoi-training==0.3.1
anemoi-transform==0.1.0
anemoi-utils==0.4.9
:::

This `anemoi` container uses `lumi-rocm-rocm-6.2.2.sif` as base-image.  

If you want to recreate the conda environment as a virtual environment
An example requirements file for anemoi can be found in `requirements.txt`

## Issues
This container does not include [`flash-attn`](https://github.com/Dao-AILab/flash-attention) as for now I have not been able to include it through the `cotainr` installation procedure (ticket has been created with user-support)

