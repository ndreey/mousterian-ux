#!/bin/bash

# Install terminal tools
source install/mousterian-toolkit.sh

# Install mamba and basic environment
source install/mousterian-mamba.sh

# Install desktop tools and tweaks
source install/mousterian-desktop.sh

# Stow dotfiles
source stow/stow-mousterian-ux.sh

# Set the lazy loading of conda/mamba in .bashrc to speed up shell startup time.
source install/mamba/set-lazyload.sh
