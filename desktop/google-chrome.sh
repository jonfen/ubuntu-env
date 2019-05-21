#!/bin/bash

## install google-chrome-stable

sudo apt -y install wget

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

# On some installations chrome is really slow, Disable Hardware Acceleration to fix
# chrome://settings/?search=hardware