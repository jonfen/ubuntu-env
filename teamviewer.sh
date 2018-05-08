#!/bin/bash

## install teamviewer

sudo apt-get -y install gdebi-core wget
cd ~/Downloads
wget https://download.teamviewer.com/download/teamviewer_i386.deb
sudo gdebi -n teamviewer*.deb
rm -f teamviewer*.deb
