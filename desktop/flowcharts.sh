#!/bin/bash

# Install Dia AND yEd

sudo apt -y install wget dia libcanberra-gtk-module libcanberra-gtk3-module

# https://www.yworks.com/downloads#yEd
INSTALL_SCRIPT="yEd-3.19_with-JRE11_64-bit_setup.sh"
cd ~/Downloads
wget https://www.yworks.com/resources/yed/demo/$INSTALL_SCRIPT
chmod a+x $INSTALL_SCRIPT 
./$INSTALL_SCRIPT
rm ./$INSTALL_SCRIPT
