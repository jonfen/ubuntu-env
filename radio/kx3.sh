#!/bin/bash

# Elecraft KX3
# https://elecraft.com/pages/firmware-software

sudo dpkg --add-architecture i386
sudo apt-get install wget libc6:i386 libncurses5:i386 libstdc++6:i386 libgtk2.0-0:i386 lynx awk curl
mkdir -p ~/Downloads/kx3
cd ~/Downloads/kx3
wget $(lynx -dump -listonly https://ftp.elecraft.com/KX3/Utilities/ | grep tar.gz | awk  '{print $2}')
tar -zxf *.tar.gz
rm *.tar.gz
sudo adduser $(whoami) dialout
cd kx3util_1_16_6_25 
sudo ./kx3util
