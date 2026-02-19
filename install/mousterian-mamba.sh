#!/bin/bash

# Install mamba first
source install/mamba/miniforge3.sh

sleep 1
# Reload bashrc so mamba is now in PATH for this session
source $HOME/.bashrc
sleep 1

# Initialize mamba shell integration
eval "$(mamba shell hook --shell bash)"
sleep 1

# Set up mamba channels and initialize
source install/mamba/set-config.sh

# NOW run mamba env installers (they can use mamba create)
for installer in install/mamba/env-*.sh; do source $installer; done