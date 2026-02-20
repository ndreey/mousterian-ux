#!/bin/bash

sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update
sudo apt install ulauncher -y

# Start ulauncher to have it populate config before we overwrite
cd dotfiles/
stow -t $HOME autostart/
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # ensure enough time for ulauncher to set defaults
rm $HOME/.config/ulauncher/settings.json
stow -t $HOME ulauncher/
cd -
