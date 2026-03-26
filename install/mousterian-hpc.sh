#!/bin/bash

# Install mamba and basic environment
source install/mousterian-mamba.sh

# stow the dotfiles
source stow/stow-mousterian-toolkit.sh

# Set the lazy loading of conda/mamba in .bashrc to speed up shell startup time.
source install/mamba/set-lazyload.sh
