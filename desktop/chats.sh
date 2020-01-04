#!/bin/bash
sudo apt update

## Slack
sudo apt install snapd
sudo snap install slack --classic


# https://signal.org/download/#linuxModal
sudo apt -y install curl
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt -y install signal-desktop


# IRC

sudo apt install weechat
