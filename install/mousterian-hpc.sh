#!/bin/bash

# Back up bashrc
[ -f $HOME/.bashrc ] && cp $HOME/.bashrc $HOME/.bashrc.bak

# Install mamba and basic environment
source install/mousterian-mamba.sh

# Activate the cli env and stow the toolkit dotfiles
mamba activate cli
sleep 2

# Backup dotfiles first
source backup/oldowan-backup.sh

# stow the dotfiles
source stow/stow-mousterian-toolkit.sh

# populate .bashrc with conda and mamba init lines
conda init bash
mamba shell init

mamba deactivate
sleep 2