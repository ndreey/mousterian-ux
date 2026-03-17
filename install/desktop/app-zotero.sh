#!/bin/bash

# Install Zotero from the unofficial deb package maintained by retorquere
# https://github.com/retorquere/zotero-deb

wget -qO- https://raw.githubusercontent.com/retorquere/zotero-deb/master/install.sh | sudo bash

sudo apt update
sudo apt install -y zotero
