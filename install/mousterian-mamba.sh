#!/bin/bash

# Back up bashrc
[ -f $HOME/.bashrc ] && cp $HOME/.bashrc $HOME/.bashrc.bak

# Install mamba first
source install/mamba/miniforge3.sh

# Reload bashrc so mamba is now in PATH for this session
source $HOME/.bashrc

# NOW run mamba env installers (they can use mamba create)
for installer in install/mamba/env-*.sh; do source $installer; done

# Activate the cli env and stow the toolkit dotfiles
mamba activate cli
# Backup dotfiles first
source backup/oldowan-backup.sh
# stow the dotfiles
source stow/stow-mousterian-toolkit.sh

# Initialize mamba in bash in the stowed .bashrc
conda init bash
mamba init bash