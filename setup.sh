#!/bin/bash
source config.sh

sudo apt update
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt -y install git 
git config --global user.email $GIT_EMAIL 
git config --global user.name $GIT_NAME
git config --global core.editor vi

# https://github.com/Yubico/pam-u2f
mkdir -p ~/dev/github.com/Yubico
cd ~/dev/github.com/Yubico
git clone git://github.com/Yubico/pam-u2f.git
cd pam-u2f
sudo apt -y install pkg-config libu2f-host-dev libu2f-server-dev autoconf automake libtool libpam-dev asciidoc xsltproc libxml2-utils docbook-xml
autoreconf --install
./configure
make
sudo make install
rm -rf ~/dev/github.com/Yubico

# AUTHFILE cannot exist in an encrypted directory
# Check if /home is encrypted and save AUTHFILE accordingly
if [ -f $HOME/.ecryptfs ]; then
  AUTHFILE='/etc/u2f_mappings'
else
  AUTHFILE='~/.config/Yubico/u2f_keys'
fi

pamu2fcfg --username=$USER 1>$AUTHFILE
PAMFILE='/etc/pam.d/pam_u2f'
sudo echo "auth sufficient pam_u2f.so debug authfile=$AUTHFILE" 1>$PAMFILE 
