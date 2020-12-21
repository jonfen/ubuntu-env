#!/bin/bash

## pass
# https://www.passwordstore.org/

sudo apt -y install pass

# KeePass2

# sudo add-apt-repository ppa:jtaylor/keepass
#sudo apt -y install keepass2

## LastPass & CLI setup
# https://lastpass.com/lplinux.php

sudo apt -y install wget tar lastpass-cli

mkdir ~/Downloads/lastpass
cd ~/Downloads/lastpass || exit
wget https://download.cloud.lastpass.com/linux/lplinux.tar.bz2
tar xjvf ./lplinux.tar.bz2
./install_lastpass.sh
# wget https://addons.mozilla.org/firefox/downloads/file/931368/
# firefox lastpass_password_manager-4.9.2.0-an+fx.xpi
cd ~ || exit
rm -rf ~/Downloads/lastpass
man lastpass-cli
