#!/bin/bash

# https://www.yworks.com/downloads#yEd

sudo apt -y install wget dia libcanberra-gtk-module libcanberra-gtk3-module

INSTALL_SCRIPT="yEd-3.18.2_with-JRE10_64-bit_setup.sh"
cd ~/Downloads
wget https://www.yworks.com/resources/yed/demo/$INSTALL_SCRIPT
chmod a+x $INSTALL_SCRIPT 
./$INSTALL_SCRIPT
rm ./$INSTALL_SCRIPT
