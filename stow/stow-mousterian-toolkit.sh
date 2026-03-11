#!/bin/bash

DOTFILES=dotfiles

# bash
cp "$DOTFILES/bash/.bashrc" "$HOME/"
cp "$DOTFILES/bash/.profile" "$HOME/"
cp -r "$DOTFILES/bash/.shell.d" "$HOME/"

# git
cp "$DOTFILES/git/.gitconfig" "$HOME/"