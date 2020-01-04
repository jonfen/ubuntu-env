#!/bin/bash

# WSJTX
# https://www.physics.princeton.edu/pulsar/k1jt/wsjtx.html
# http://www.physics.princeton.edu/pulsar/K1JT/wsjtx-doc/wsjtx-main-2.1.2.html#INSTALL_LINUX

sudo apt -y install libqt5multimedia5-plugins libqt5serialport5 libqt5sql5-sqlite libfftw3-single3 wget
mkdir -p ~/Downloads/wsjtx
cd ~/Downloads/wsjtx
wget https://www.physics.princeton.edu/pulsar/k1jt/wsjtx_2.1.2_amd64.deb
sudo dpkg -i wsjtx_2.1.2-devel_amd64.deb

