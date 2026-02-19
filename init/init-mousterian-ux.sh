#!/bin/bash

# Install terminal tools
source install/mousterian-toolkit.sh

# Install mamba and basic environment
source install/mousterian-mamba.sh

# Install desktop tools and tweaks
source install/mousterian-desktop.sh

# Stow dotfiles
source stow/stow-mousterian-ux.sh

# Initialize mamba shell integration
eval "$(mamba shell hook --shell bash)"
sleep 1

# populate .bashrc with conda and mamba init lines
conda init bash
mamba shell init