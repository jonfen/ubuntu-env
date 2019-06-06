#!/bin/bash

## install CHIRP
## https://chirp.danplanet.com/

sudo apt-add-repository ppa:dansmith/chirp-snapshots
sudo apt update
sudo apt -y install chirp-daily

# Elecraft KX3
# https://elecraft.com/pages/firmware-software

sudo dpkg --add-architecture i386
sudo apt-get install wget libc6:i386 libncurses5:i386 libstdc++6:i386 libgtk2.0-0:i386 
mkdir -p ~/Downloads/kx3
cd ~/Downloads/kx3
wget http://www.elecraft.com/software/KX3/KX3UtilityLINUX_1_16_6_25.tgz
tar -zxf KX3UtilityLINUX_1_16_6_25.tgz
cd kx3util_1_16_6_25 
./kx3util
