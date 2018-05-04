#!/bin/bash

## LastPass setup
## https://lastpass.com/lplinux.php

sudo apt install wget tar

mkdir ~/Downloads/lastpass
cd ~/Downloads/lastpass || exit
wget https://lastpass.com/lplinux.tar.bz2
tar xjvf ./lplinux.tar.bz2
./install_lastpass.sh
# wget https://addons.mozilla.org/firefox/downloads/file/931368/
# firefox lastpass_password_manager-4.9.2.0-an+fx.xpi
cd ~ || exit
rm -rf ~/Downloads/lastpass
