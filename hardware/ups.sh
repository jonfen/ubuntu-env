#!/bin/bash

# APC UPS
sudo apt -y install apcupsd
# sudo vi /etc/default/apcupsd
## ISCONFIGURED=yes
# sudo vi /etc/apcupsd/apcupsd.conf
## UPSNAME homeups1
## UPSCABLE usb
## # DEVICE ...
sudo /etc/init.d/apcupsd start
apcaccess
