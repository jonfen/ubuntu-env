#!/bin/bash
source config.sh

sudo apt update

## install google-chrome-stable
./google-chrome.sh

## install snaps
sudo apt install snapd
sudo snap install spotify signal-desktop
sudo snap install android-studio --classic
sudo snap install slack --classic
sudo snap install atom --classic
sudo snap list

## add to favorites
dconf read /org/gnome/shell/favorite-apps
dconf write /org/gnome/shell/favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Software.desktop', 'yelp.desktop', 'org.gnome.Terminal.desktop', 'spotify_spotify.desktop', 'google-chrome.desktop', 'signal-desktop_signal-desktop.desktop', 'slack_slack.desktop', 'atom_atom.desktop']"

## install packages
sudo apt -y install git rsync tree wireshark wget unzip curl libreoffice

## upgrade packages
sudo apt -y dist-upgrade

## LastPass setup
./lastpass.sh

# git setup
./git.sh

# Yubico FIDO U2F Security Key setup
./pam_u2f.sh

# configure openVPN
./openvpn.sh

# install teamviewer
./teamviewer.sh

# install arduino IDE
./arduino.sh

# install virtualbox & download VMs
./virtualbox.sh

# add printers
./printers.sh

# add ham radio
./ham-radio.sh

# install gnome extensions
./gnome-extensions.sh

# security checks
./security.sh

## cleanup
sudo apt -y autoremove
