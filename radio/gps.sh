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
