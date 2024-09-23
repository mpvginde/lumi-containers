#!/bin/bash
virtualenv .venv
source .venv/bin/activate
pip install git+https://github.com/ecmwf/anemoi-training.git@feature/limited_area