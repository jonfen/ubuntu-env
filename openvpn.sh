#!/bin/bash

## Setup openVPN client

sudo apt -y install openvpn nmcli
sudo apt -y install network-manager-openvpn || sudo apt install network-manager-openvpn-gnome

cd ~/.ssh || exit

read -p "Place the private keys and opvn files in ~/.ssh and press any key..."

## The name of the VPN connection comes from the file name (ex: NAME.ovpn)
sudo nmcli connection import type openvpn file *.ovpn

# gnome-shell --replace &
