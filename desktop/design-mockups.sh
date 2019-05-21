#!/bin/bash

# https://wireframesketcher.com/download.html

sudo apt -y install wget

cd ~/Downloads
wget https://wireframesketcher.com/downloads/WireframeSketcher-latest_amd64.deb
sudo dpkg -i WireframeSketcher-latest_amd64.deb
rm WireframeSketcher-latest_amd64.deb
