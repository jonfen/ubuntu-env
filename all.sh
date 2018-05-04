#!/bin/bash
source config.sh

sudo apt update

## install google-chrome-stable
./google-chrome.sh

## install snaps
sudo apt install snapd
sudo snap install spotify signal-desktop
sudo snap install --classic android-studio slack
sudo snap list

## install packages
sudo apt -y install git rsync tree wireshark wget unzip

## upgrade packages
sudo apt -y dist-upgrade
sudo apt -y autoremove

## LastPass setup
./lastpass.sh

# git setup
./git.sh

# Yubico FIDO U2F Security Key setup
./pam_u2f.sh
