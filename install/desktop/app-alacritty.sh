#!/bin/bash

# Installing the terminal emulator Alacritty,
sudo apt install -y alacritty

# Create config directory to stow dotfiles
mkdir -p ~/.config/alacritty

# Make alacritty default terminal emulator
sudo update-alternatives --set x-terminal-emulator /usr/bin/alacritty
