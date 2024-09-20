# Towards an anemoi container on LUMI

<p style="text-align: center;"> <b> In progress. A test build has not yet been performed! </b> <p>
 
We aime to construct a container that allows to have full anemoi functionality for development of a LAM MLWP model. 
Given the current in progress status of LAM in anemoi we will probably leave out some parts of anemoi that we expect to significantly evolve in the near future. These extra parts should be loaded in a virtual environment. We will probably include instructions/documentation on that environment here as well.

### Plan of action
#### Original plan
Start from aifs-mono-hackathon.yaml, make modifications which will be of two types:

1. update to new lumi software stack
- we should be able to move to `>= torch 2.3` since LUMI now supports ROCm 6.0.3
But `/appl/local/containers/sif-images/` contains no pre-build ROCm 6.0.3 container yet. [20/09/2024]
- others?

2. replace aifs-mono by most recent anemoi
- ...

We could copy the aifs-mono-hackathon.yml and build.sh and start modifying it progresively. 

#### Alternative short term plan
Start from a minimal container, do essentially everything in a virtual environment, then progresively move things from environment into container.

Currently:

One can build the proto-container with `build_proto.sh`, then install anemoi-training in a virtual environment with `install_venv_in_container.sh`. [Installation seems to proceed correctly. Trying out anemoi-training inside the container remains to be done.]


### Open issues