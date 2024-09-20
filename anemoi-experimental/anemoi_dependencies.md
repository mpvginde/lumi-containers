# Dependencies of anemoi packages
Here we list the dependencies of the various anemoi packages we plan to include. These list are taken from the pyproject.toml file of the respective github repository.

1. [anemoi-training](https://github.com/ecmwf/anemoi-training/blob/feature/limited_area/pyproject.toml)
    - requires-python>=3.9
    - dependencies
        - anemoi-datasets>=0.4
        - anemoi-graphs@git+https://github.com/ecmwf/anemoi-graphs.git@feature/8-stretched-grid-graphs
        - anemoi-models
        - anemoi-utils[provenance]>=0.3.10
        - einops>=0.6.1
        - hydra-core>=1.3
        - matplotlib>=3.7.1
        - mlflow>=2.11.1
        - numpy<2                          # Pinned until we can confirm it works with anemoi graphs
        - pynvml>=11.5
        - pyshtools>=4.10.4
        - pytorch-lightning>=2.1
        - timm>=0.9.2
        - torch>=2.2
        - torch-geometric>=2.3.1,<2.5
        - torchinfo>=1.8
        - tqdm>=4.65
        - zarr>=2.14.2

1. [anemoi-graphs](https://github.com/ecmwf/anemoi-graphs/blob/feature/8-stretched-grid-graphs/pyproject.toml)
    - requires-python>=3.9
    - dependencies
        -  anemoi-datasets[data]>=0.3.3 #not sure what [data] here refers to?
        - anemoi-utils>=0.3.6
        - h3>=3.7.6,<4
        - healpy>=1.17
        - hydra-core>=1.3
        - matplotlib>=3.4
        - networkx>=3.1
        - plotly>=5.19
        - torch>=2.2
        - torch-geometric>=2.3.1,<2.5
        - trimesh>=4.1

1. [anemoi-utils](https://github.com/ecmwf/anemoi-utils/blob/develop/pyproject.toml)
    - requires-python >=3.9
    - dependencies
        - aniso8601
        - pyyaml
        - tomli     # Only needed before 3.11
        - tqdm
    - optional-dependencies.provenance
        - gitpython
        - nvsmi

1. [anemoi-datasets](https://github.com/ecmwf/anemoi-datasets/blob/develop/pyproject.toml)
    - requires-python >=3.9
    - dependencies 
        - anemoi-utils[provenance]>=0.3.9
        - numpy
        - pyyaml
        - semantic-version
        - tqdm
        - zarr<=2.17

1. [anemoi-models](https://github.com/ecmwf/anemoi-models/blob/develop/pyproject.toml)
    - requires-python =3.9
    - dependencies
        - anemoi-utils>=0.1.9
        - einops>=0.6.1
        - hydra-core>=1.3
        - torch>=2.2
        - torch-geometric>=2.3,<2.5