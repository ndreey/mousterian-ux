#!/bin/bash

if [ ! -f /etc/apt/keyrings/packages.microsoft.gpg ] || [ ! -f /usr/share/keyrings/microsoft.gpg ]; then
  [ -f /etc/apt/keyrings/packages.microsoft.gpg ] && sudo rm /etc/apt/keyrings/packages.microsoft.gpg
  cd /tmp
  wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
  sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
  echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list >/dev/null
  rm -f packages.microsoft.gpg
  cd - > /dev/null
fi

sudo apt update
sudo apt install -y code

mkdir -p $HOME/.config/Code/User

# Install current using themes
code --install-extension fey.oscura
code --install-extension marlosirapuan.nord-deep

# Install the VIM extension for VSCode
code --install-extension vscodevim.vim

# ssh and hpc related
code --install-extension ms-vscode-remote.remote-ssh
code --install-extension ms-vscode.live-server

# Language support
code --install-extension nextflow.nextflow

# Quality of life
code --install-extension github.copilot-chat
code --install-extension alefragnani.project-manager
code --install-extension mechatroner.rainbow-csv
code --install-extension shd101wyy.markdown-preview-enhanced
