#!/bin/bash

# VK-162 G-Mouse USB GPS Dongle
sudo apt -y install gpsd gpsd-clients python-gps python-gi-cairo
sudo stty -F /dev/ttyACM0
# /etc/default/gpsd needs /dev/ttyACM0 added
# cgps -s 
# xgps

# Set System Clock via GPS
cp ./gpsutcset.py ~
# sudo gspd /dev/ttyACM0 -F /var/run/gpsd.sock
sudo python ~/gpsutcset.py

## install CHIRP
## https://chirp.danplanet.com/

sudo apt-add-repository ppa:dansmith/chirp-snapshots
sudo apt update
sudo apt -y install chirp-daily

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

cd ..
wget https://ftp.elecraft.com/PX3/Utilities/PX3UtilityLINUX_1_15_9_18.tgz
tar -zxf PX3UtilityLINUX_1_15_9_18.tgz
cd px3util_1_15_9_18
sudo ./px3util

# cqrlog
# https://www.cqrlog.com
cd ~/Downloads
git clone https://github.com/ok2cqr/cqrlog
cd ./cqrlog/docker-build
docker build -t this.registry.is.invalid/cqrlog-build .

# fldigi
# http://www.w1hkj.com/

# WSJTX
