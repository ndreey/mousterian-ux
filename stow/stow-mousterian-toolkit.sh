#!/bin/bash

DOTFILES=dotfiles

mkdir -p "$HOME/.config/tmux"

# bash
cp "$DOTFILES/bash/.bashrc" "$HOME/"
cp "$DOTFILES/bash/.profile" "$HOME/"
cp -r "$DOTFILES/bash/.shell.d" "$HOME/"

# git
cp "$DOTFILES/git/.gitconfig" "$HOME/"

# vim
cp "$DOTFILES/vim/.vimrc" "$HOME/"

# Place both configs here to work on server wide or personal tmux.
cp "$DOTFILES/tmux/tmux.conf" "$HOME/.tmux.conf"
cp "$DOTFILES/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
