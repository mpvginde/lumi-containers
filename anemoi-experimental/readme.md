# Towards an anemoi container on LUMI

<p style="text-align: center;"> <b> In progress. A test build has not yet been performed! </b> <p>
 
We aime to construct a container that allows to have full anemoi functionality for development of a LAM MLWP model. 
Given the current in progress status of LAM in anemoi we will probably leave out some parts of anemoi that we expect to significantly evolve in the near future. These extra parts should be loaded in a virtual environment. We will probably include instructions/documentation on that environment here as well.

### Plan of action
Start from aifs-mono-hackathon.yaml, make modifications which will be of two types:

1. update to new lumi software stack
- we should be able to move to `>= torch 2.3` since LUMI now supports 'ROCm 6.0.3' [Change not yet.]
- others?

2. replace aifs-mono by most recent anemoi
- ...

We copy the aifs-mono-hackathon.yml and will start modifying it progresively. Changes will be  documented below.

### Implemented modifications
**currently anemoi-experimental.yml remains identical to aifs-mono-hackathon.yml**
1. change:
   motivation:

### Open issues