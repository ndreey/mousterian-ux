#!/bin/bash

# Prompt for mamba path first
echo "Is mamba installed and do you want to set up lazy loading for it? If so, provide the path to the mamba executable."
echo "Example: \$HOME/miniforge3/bin/mamba"

while true; do
  read -p "Path to mamba (press Enter to skip): " MAMBA_EXE_PATH
  echo ""

  # User skipped
  if [ -z "$MAMBA_EXE_PATH" ]; then
    break
  fi

  # Expand $HOME or ~ in case user typed it literally
  MAMBA_EXE_PATH="${MAMBA_EXE_PATH/#\~/$HOME}"

  if [ -f "$MAMBA_EXE_PATH" ]; then
    break
  else
    echo "Path does not exist: $MAMBA_EXE_PATH"
    echo "Please try again or press Enter to skip."
  fi
done

echo "Stow dotfiles and configs for:"
echo "1) Fresh ubuntu desktop install"
echo "2) HPC environment / safe for any system"
echo ""

select INSTALL_MODE in \
  "stow-desktop" \
  "stow-core"
do
  case $INSTALL_MODE in
    "stow-desktop"|"stow-core")

      source backup/oldowan-backup.sh

      if [ "$INSTALL_MODE" = "stow-desktop" ]; then
        echo "Selected: Stow dotfiles and configs for fresh ubuntu desktop install"
        source stow/stow-mousterian-ux.sh
      else
        echo "Selected: Stow dotfiles and configs for HPC environment / safe for any system"
        source stow/stow-mousterian-toolkit.sh
      fi

      echo "dotfiles and configs stowed"

      # Run lazyload setup if mamba path was provided
			if [ -n "$MAMBA_EXE_PATH" ]; then
				source stow/stow-lazyload.sh "$MAMBA_EXE_PATH"
			fi

      break
      ;;
  esac
done
