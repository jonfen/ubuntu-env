#!/bin/bash

# Install Python3
sudo apt install -y python3-pip python3-dev
sudo apt install build-essential libssl-dev libffi-dev python-dev

# Upgrade to Python 3.7
sudo apt install python3.7 python3.7-dbg python3.7-doc python3.7-minimal python3.7-dev python3.7-examples python3.7-venv

# Install IDLE (Integrated Development and Learning Environment)
sudo apt install -y idle

# Install snaps
# sudo snap install pycharm-professional --classic
sudo snap install pycharm-professional --classic

# Virtual Environments
sudo apt install -y python3-venv
mkdir -p ~/dev/environments
# cd ~/dev/environments
# python3 -m venv my_env
# source my_env/bin/activate

# deactivate

