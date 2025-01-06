# anemoi container
This container contains
- stable release versions of torch(vision|audio) 2.3.0 compiled against ROCm 6.0.3
- specific commits of the full anemoi framework that works for Limited Area Training/Inference on LUMI together with 
- most recent versions of the needed dependencies

The following anemoi versions (git hashes) are installed
:::success
anemoi-datasets:    `1c75729e8522f3fda2ba7c0e60fe6a4fe6d9e28f`
anemoi-graphs:      `3898f6fbfa82ad67eb84fd7bc9d7ecfeb23786d4`
anemoi-models:      `f3b2ec1b833dad72dcbbc561981aa456f1ee6b38`
anemoi-training:    `15312f9b2bd868159050a04b34fb132c86db3b3d`
anemoi-transform:   `7b91806ef91737d6a0df122778f5c948d965572b`
anemoi-utils:       `0a6e39a8ef5e35a8b4618d63b9390e2fe86fa06f`
anemoi-inference:   `da33b3c507ee8248000a93ca1859099e7d7325dc`
:::

>[!WARNING]
> The included version of `anemoi-inference` is not compatible with the checkpoints genereted by the included version of `anemoi-training`!

This `anemoi` container uses `lumi-rocm-rocm-6.0.3.sif` as base-image.  

## Issues
This container does not include [`flash-attn`](https://github.com/Dao-AILab/flash-attention) as for now I have not been able to include it through the `cotainr` installation procedure (ticket has been created with user-support)

