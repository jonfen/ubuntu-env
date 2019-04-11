#!/bin/bash

## install teamviewer

sudo apt-get -y install gdebi-core wget
cd ~/Downloads
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo gdebi -n teamviewer*.deb
rm -f teamviewer*.deb
