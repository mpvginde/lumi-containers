# anemoi-base container
This container contains a base environment for workin with anemoi on LUMI.
> ⚠️ This container does not include the actual anemoi software!

The purpose of this container is to use it as _base-environment_ for your personal virtual environment containing anemoi.
This can be usefull when developing anemoi or testing specific branches.

This `anemoi-base` container uses `lumi-rocm-rocm-6.2.2.sif` as base-image.
You can use the example `build-venv.sh` script to build your own virtual environment.
Make sure to replace `<user-name>` and `<venv-name>`!

> ⚠️ Please, do not install your virtual environment in the general container folder of the project.

An example requirements file for anemoi can be found in `requirements.txt`

> ⚠️ Make sure to activate your virtual environment when using this container in your scripts

## Issues
This container does not include [`flash-attn`](https://github.com/Dao-AILab/flash-attention) as for now I have not been able to include it through the `cotainr` installation procedure (ticket has been created with user-support)

