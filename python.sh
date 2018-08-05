#!/bin/bash

# Install Python3
sudo apt install -y python3-pip
sudo apt install build-essential libssl-dev libffi-dev python-dev

# Install IDLE (Integrated Development and Learning Environment)
sudo apt install -y idle

# Install snaps
# sudo snap install pycharm-professional --classic
sudo snap install pycharm-community --classic

# Virtual Environments
sudo apt install -y python3-venv
mkdir -p ~/dev/environments
# cd ~/dev/environments
# python3 -m venv my_env
# source my_env/bin/activate

# deactivate

