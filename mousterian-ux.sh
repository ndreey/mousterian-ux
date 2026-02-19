#!/bin/bash

MOUST_VERSION="v0.1.0"

# Exit immediately if a command exits with a non-zero status
set -e

# Something went wrong
trap 'echo "mousterian-ux failed to install"' ERR

ascii_art="
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠲⠦⠤⣄⣀⠀⢀⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣀⠀⠀⠀⠀⠀⠘⠿⠟⠀⢤⠀⣠⣤⣄⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⡆⠀⠀⠀⠀⢰⡖⠀⠀⠀⠀⠙⠿⠿⠓⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⠃⠀⠀⠀⠀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⢀⣠⣤⣤⣤⣄⡉⠁⣠⡄⢀⣀⣼⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⣰⣿⣿⠟⣿⣿⡿⠁⣴⣿⠁⡸⠿⠿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⢰⡿⠋⠀⢰⠿⠋⡀⢈⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⣿⡇⠀⠀⠠⠴⣾⣿⣿⣯⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠉⠁⠀⠀⢀⣀⣼⣿⡿⠿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠛⣿⠿⣄⠀⢠⣾⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⣿⠀⠁⠀⠁⠀⠀⠉⢿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢀⣤⣤⣤⣤⣾⡿⠃⠀⠀⠀⠀⠀⠀⠘⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿  mousterian-ux $MOUST_VERSION
"
echo -e "$ascii_art"

sleep 1

echo "Select installation mode (exit installer with ctrl+c):"
echo "1) Fresh Ubuntu install with GNOME (sudo required)"
echo "2) HPC user environment (no sudo)"
echo "3) Stow dotfiles and configs only (no install)"
echo "4) Check permissions, OS and desktop environment (no install)"
echo ""


select INSTALL_MODE in \
  "fresh-root" \
  "hpc-user" \
  "stow-only" \
  "check-only"
do
  case $INSTALL_MODE in
    "fresh-root")
      echo -e "Selected: Fresh Ubuntu install with root access\n"

      # Check root access, os release and desktop environment
      source /etc/os-release

      if [[ "$ID" != "ubuntu" ]]; then
        echo "This installer is designed for Ubuntu. Exiting."
        exit 1
      fi

      if [[ "$XDG_CURRENT_DESKTOP" != *"GNOME"* ]]; then
        echo "This installer is designed for GNOME desktop environment. Exiting."
        exit 1
      fi

      if groups "$USER" | grep -q "\bsudo\b"; then
        echo "You have sudo access!"
      else
        echo "You do NOT have sudo access!"
        exit 1
      fi

      # Ensure computer doesn't go to sleep or lock while installing
      gsettings set org.gnome.desktop.screensaver lock-enabled false
      gsettings set org.gnome.desktop.session idle-delay 0
      echo "Installing $MOUST_VERSION of the mousterian toolkit and ux..."
      echo -e "Be prepared to enter your password multiple times and accept GNOME extensions\n"

      # Backup dotfiles before installing
      source backup/oldowan-backup.sh

      # Install mousterian toolkit and ux
      source init/init-mousterian-ux.sh
      
      # Revert to normal idle and lock settings
      gsettings set org.gnome.desktop.screensaver lock-enabled true
      gsettings set org.gnome.desktop.session idle-delay 300

      echo -e "install complete! Reboot to finalize everything"
      break
      ;;

    # Install the HPC or user friendly core toolkit
    "hpc-user")
      echo -e "Selected: HPC user environment (no sudo)\n"
      echo "Installing $MOUST_VERSION of the core mousterian toolkit that is safe for HPC and user.."
      echo -e "Be prepared to interact with prompts\n"

      # Install the mamba env and stow the dotfiles and configs for the HPC user environment
      source init/init-mousterian-hpc.sh

      echo -e "Install complete!"
      echo -e "You need to restart your terminal or source your ~/.bashrc"
      break
      ;;
    
    # Just backup and stow the dotfiles and configs, no installs or checks
    "stow-only")
      echo "Selected: Stow dotfiles and configs only (no install)"
      source init/init-stow.sh
      break
      ;;
    
    # Just check permissions, os release and desktop environment, but don't install anything
    "check-only")
      echo -e "Selected: Check permissions, OS and desktop environment (no install)\n"
      source /etc/os-release
      echo "OS: $PRETTY_NAME"
      echo "Desktop Environment: $XDG_CURRENT_DESKTOP"

      # If the user is in the sudo group, they have sudo access
      if groups "$USER" | grep -q "\bsudo\b"; then
        echo "You have sudo access!"
      else
        echo "You do NOT have sudo access!"
      fi
      break
      ;;
    *)
      echo "Invalid option. Please choose 1, 2 or 3."
      ;;
  esac
done