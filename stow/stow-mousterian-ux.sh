#!/bin/bash

DOTFILES=dotfiles

mkdir -p "$HOME/.config/"{autostart,gtk-3.0,ulauncher,alacritty,Code/User,Positron/User,tmux}

# alacritty
cp "$DOTFILES/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
cp "$DOTFILES/alacritty/everforest_dark_hard.toml" "$HOME/.config/alacritty/"

# bash
cp "$DOTFILES/bash/.bashrc" "$HOME/"
cp "$DOTFILES/bash/.profile" "$HOME/"
cp -r "$DOTFILES/bash/.shell.d" "$HOME/"

# conda
cp "$DOTFILES/conda/.condarc" "$HOME/"

# vim
cp "$DOTFILES/vim/.vimrc" "$HOME/"

# git
cp "$DOTFILES/git/.gitconfig" "$HOME/"

# gtk
cp "$DOTFILES/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/"

# ulauncher
cp "$DOTFILES/ulauncher/ulauncher.desktop" "$HOME/.config/autostart/"
cp "$DOTFILES/ulauncher/settings.json" "$HOME/.config/ulauncher/"

# vscode
cp $DOTFILES/vscode/*.json "$HOME/.config/Code/User/"

# positron
cp $DOTFILES/positron/*.json "$HOME/.config/Positron/User/"

# Place both configs here to work on server wide or personal tmux.
cp "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
cp "$DOTFILES/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
