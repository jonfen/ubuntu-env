#!/bin/bash

# https://support.nordvpn.com/#/path/1325531132 

sudo apt -y install wget
cd ~/Downloads
sudo wget -qnc https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i ./nordvpn-release_1.0.0_all.deb
sudo apt update
sudo apt -y install nordvpn
nordvpn login
# nordvpn countries
# nordvpn connect <country>
