#!/bin/bash

# Install terminal tools
source install/mousterian-toolkit.sh

# Install desktop tools and tweaks
source install/mousterian-desktop.sh

# Stow dotfiles
source stow/stow-mousterian-ux.sh

# Install mamba and basic environment
source install/mousterian-mamba.sh