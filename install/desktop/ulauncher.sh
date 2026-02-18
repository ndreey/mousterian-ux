#!/bin/bash

sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update
sudo apt install ulauncher -y

# Start ulauncher to have it populate config before we overwrite
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # ensure enough time for ulauncher to set defaults

# Stow the dotfile and settings
cd dotfiles
stow -t $HOME ulauncher/
stow -t $HOME autostart/
cd -