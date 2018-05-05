#!/bin/bash

## Setup openVPN client

sudo apt -y install openvpn
sudo apt-get install network-manager-openvpn || sudo apt-get install network-manager-openvpn-gnome

gnome-shell --replace

