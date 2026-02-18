#!/bin/bash

# Stow dotfiles and configs for mousterian-ux
cd dotfiles/
stow -t $HOME autostart/
stow -t $HOME bash/
stow -t $HOME git/
stow -t $HOME gtk/
stow -t $HOME ulauncher/
stow -t $HOME vscode/
cd -