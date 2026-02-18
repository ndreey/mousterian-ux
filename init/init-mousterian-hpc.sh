#!/bin/bash

# Source hpc installs (remove??)
source install/mousterian-hpc.sh

# Stow dotfiles
source stow/stow-mousterian-toolkit.sh

# Install mamba and basic environment
source install/mousterian-mamba.sh