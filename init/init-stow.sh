#!/bin/bash


echo "Stow dotfiles and configs for:"
echo "1) Fresh ubuntu desktop install"
echo "2) HPC environment / safe for any system"
echo ""

select INSTALL_MODE in \
  "stow-desktop" \
  "stow-core"
do
  case $INSTALL_MODE in
    "stow-desktop")
      echo "Selected: Stow dotfiles and configs for fresh ubuntu desktop install"
      source stow/stow-mousterian-ux.sh
      break
      ;;
    "stow-core")
      echo "Selected: Stow dotfiles and configs for HPC environment / safe for any system"
      source stow/stow-mousterian-toolkit.sh
      break
      ;;
  esac
done