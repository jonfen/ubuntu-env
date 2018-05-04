#!/bin/bash
source config.sh

sudo apt update

# install google-chrome-stable
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install google-chrome-stable

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
# wget https://addons.mozilla.org/firefox/downloads/file/931368/
# firefox lastpass_password_manager-4.9.2.0-an+fx.xpi
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
  AUTHFILE="$HOME/.config/Yubico/u2f_keys"
  mkdir -p "$HOME/.config/Yubico"
  sudo touch "$AUTHFILE"
fi

echo "Press the device"
sudo pamu2fcfg --username="$USER" | sudo tee "$AUTHFILE"

# echo "auth	   required   pam_u2f.so cue" | sudo tee "/etc/pam.d/sudo" 
