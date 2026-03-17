#!/bin/bash

# Positron IDE for data science with R and python. https://github.com/posit-dev/positron
cd /tmp
POSITRON_VERSION=$(curl -s "https://api.github.com/repos/posit-dev/positron/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
POSITRON_DEB_URL=$(curl -s "https://api.github.com/repos/posit-dev/positron/releases/latest" | grep -Po "Positron-${POSITRON_VERSION}-x64\.deb\]\(https?://[^)]+\)" | grep -Po 'https?://[^)]+')
wget -O positron.deb "$POSITRON_DEB_URL"
sudo apt install -y ./positron.deb
rm positron.deb
cd - > /dev/null

mkdir -p $HOME/.config/Positron/User

# Install current using themes
positron --install-extension fey.oscura
positron --install-extension marlosirapuan.nord-deep

# Install the VIM extension for VScode
positron --install-extension vscodevim.vim

# Quality of life
positron --install-extension alefragnani.project-manager
positron --install-extension mechatroner.rainbow-csv
positron --install-extension shd101wyy.markdown-preview-enhanced
