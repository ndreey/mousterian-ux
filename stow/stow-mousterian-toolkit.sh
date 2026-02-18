#!/bin/bash

# Stow dotfiles and configs that are safe in any system
cd dotfiles/
stow -t $HOME bash/
stow -t $HOME git/
cd -