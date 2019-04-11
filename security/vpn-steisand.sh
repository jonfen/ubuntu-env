#!/bin/bash

# http://devops.host/blog/streisand-vpn.html

ssh-keygen
sudo apt -y install git python-pip network-manager-openvpn-gnome
sudo pip install ansible markupsafe boto botocore boto3

mkdir -p ~/dev/github.com/jlund
cd ~/dev/github.com/jlund
git clone https://github.com/jlund/streisand
cd streisand
./streisand

open ~/dev/github.com/jlund/streisand/generated-docs/streisand.html

