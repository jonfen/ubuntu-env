#!/bin/bash

## tor - torproject.org
sudo apt update
sudo apt -y install apt-transport-https wget
wget -q -O - https://deb.torproject.org/torproject.org/A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89.asc | sudo apt-key add -
echo "deb https://deb.torproject.org/torproject.org $(lsb_release -cs) main" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt -y install tor deb.torproject.org-keyring torbrowser-launcher
# https://support.torproject.org/tbb/how-to-verify-signature/
gpg --homedir ~/.local/share/torbrowser/gnupg_homedir/ --auto-key-locate nodefault,wkd --locate-keys torbrowser@torproject.org
torbrowser-launcher
