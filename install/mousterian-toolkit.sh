#!/bin/bash

# System cleanup and updates
sudo rm -rf /var/lib/dpkg/lock-frontend
sudo rm -rf /var/lib/dpkg/lock
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y

# Install essential tools for the installation process
sudo apt-get install -y curl git unzip wget

# Run terminal installers
for installer in install/terminal/*.sh; do source $installer; done
