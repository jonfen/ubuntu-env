#!/bin/bash

# Install Python3
sudo apt install -y python3-pip python3-dev
sudo apt install build-essential libssl-dev libffi-dev python-dev

# Upgrade to Python 3.7
sudo apt install python3.7 python3.7-dbg python3.7-doc python3.7-minimal python3.7-dev python3.7-examples python3.7-venv

# Install IDLE (Integrated Development and Learning Environment)
sudo apt install -y idle

# Virtual Environments
sudo apt install -y python3-venv
# mkdir -p ~/dev/environments
# cd ~/dev/environments
# python3 -m venv my_env
# source my_env/bin/activate

# deactivate

# PyVmMonitor
# http://www.pyvmmonitor.com/download.html
# sudo apt install -y wget mercurial
# hg clone https://bitbucket.org/sumerc/yappi
# cd yappi
# python3.7 setup.py install
# cd ..
# wget http://www.mediafire.com/file/qdz3f2vs31a42z6/pyvmmonitor_1.1.2_linux.x86_64.tar.gz
# tar -zxf pyvmmonitor_1.1.2_linux.x86_64.tar.gz
# rm pyvmmonitor_1.1.2_linux.x86_64.tar.gz
# sudo ln -s `pwd`/pyvmmonitor/pyvmmonitor-ui /usr/bin/pyvmmonitor-ui 
# cd pyvmmonitor
# ./pyvmmonitor-ui

# PySpy
# https://pypi.org/project/py-spy/
