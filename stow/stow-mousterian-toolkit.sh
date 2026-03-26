#!/bin/bash

DOTFILES=dotfiles

mkdir -p "$HOME/.config/tmux"

# bash
cp "$DOTFILES/bash/.bashrc" "$HOME/"
cp "$DOTFILES/bash/.bash_profile" "$HOME/"
cp -r "$DOTFILES/bash/.shell.d" "$HOME/"

# conda
cp "$DOTFILES/conda/.condarc" "$HOME/"

# git
cp "$DOTFILES/git/.gitconfig" "$HOME/"

# vim
cp "$DOTFILES/vim/.vimrc" "$HOME/"

# tmux.
cp "$DOTFILES/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
