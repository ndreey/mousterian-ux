#!/bin/bash

DOTFILES=dotfiles

mkdir -p "$HOME/.config/"{autostart,gtk-3.0,ulauncher,alacritty}

# alacritty
cp "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
cp "$DOTFILES/alacritty/everforest_dark_hard.toml" "$HOME/.config/alacritty/"

# bash
cp "$DOTFILES/bash/.bashrc" "$HOME/"
cp "$DOTFILES/bash/.profile" "$HOME/"
cp -r "$DOTFILES/bash/.shell.d" "$HOME/"

# git
cp "$DOTFILES/git/.gitconfig" "$HOME/"

# gtk
cp "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/"

# ulauncher
cp "$DOTFILES/ulauncher/ulauncher.desktop" "$HOME/.config/autostart/"
cp "$DOTFILES/ulauncher/settings.json" "$HOME/.config/ulauncher/"

# vscode
cp "$DOTFILES/vscode/settings.json" "$HOME/.config/Code/User/"
