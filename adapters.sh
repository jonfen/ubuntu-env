#!/bin/bash

## ALFA AWUS1900

sudo apt -y install git make

git clone https://github.com/zebulon2/rtl8814au.git
cd rtl8814au
make
sudo make install
sudo modprobe 8814au
cd ..

## ALFA Atheros AR9271
