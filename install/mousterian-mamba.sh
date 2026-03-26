#!/bin/bash

# Install mamba first
source install/mamba/miniforge3.sh

sleep 1
source $HOME/.bashrc
sleep 1

eval "$(mamba shell hook --shell bash)"
sleep 1

# Set config
source install/mamba/set-config.sh

# Install default mamba environments.
for installer in install/mamba/env-*.sh; do source $installer; done
