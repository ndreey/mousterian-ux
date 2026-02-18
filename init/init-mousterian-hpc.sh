#!/bin/bash

# Install mamba and basic environment
source install/mousterian-mamba.sh

# Run HPC installers after mamba env is ready
source install/mousterian-hpc.sh