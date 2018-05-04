#!/bin/bash
source config.sh

sudo apt update

# install snaps
sudo apt install snapd
sudo snap install spotify signal-desktop
sudo snap install --classic android-studio slack
sudo snap list

# install packages
sudo apt -y install git rsync tree wireshark wget unzip

# upgrade packages
sudo apt -y dist-upgrade
sudo apt -y autoremove

# LastPass setup
# https://lastpass.com/lplinux.php
mkdir ~/Downloads/lastpass
cd ~/Downloads/lastpass || exit
wget https://lastpass.com/lplinux.tar.bz2
tar xjvf ./lplinux.tar.bz2
./install_lastpass.sh
cd ~ || exit
rm -rf ~/Downloads/lastpass

# git setup
git config --global user.email "$GIT_EMAIL" 
git config --global user.name "$GIT_NAME"
git config --global core.editor vi

# Yubico FIDO U2F Security Key setup
# https://github.com/Yubico/pam-u2f
mkdir -p ~/dev/github.com/Yubico
cd ~/dev/github.com/Yubico || exit
git clone git://github.com/Yubico/pam-u2f.git
cd pam-u2f || exit
sudo apt -y install pkg-config libu2f-host-dev libu2f-server-dev autoconf automake libtool libpam-dev asciidoc xsltproc libxml2-utils docbook-xml
autoreconf --install
./configure
make
sudo make install
rm -rf ~/dev/github.com/Yubico

# AUTHFILE cannot exist in an encrypted directory
# Check if /home is encrypted and save AUTHFILE accordingly
if [ -f "$HOME/.ecryptfs" ]; then
  AUTHFILE="/etc/u2f_mappings"
else
  AUTHFILE="/$HOME/$USER/.config/Yubico/u2f_keys"
fi

pamu2fcfg --username="$USER" 1>"$AUTHFILE"
PAMFILE="/etc/pam.d/pam_u2f"
sudo echo "auth sufficient pam_u2f.so debug authfile=$AUTHFILE" 1>"$PAMFILE"
