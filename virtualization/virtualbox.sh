#!/bin/bash

sudo apt -y install virtualbox wget zip

## Install virtualbox
cd ~/Downloads || exit
wget https://aka.ms/windev_VM_virtualbox -O vm.zip; unzip vm.zip; rm vm.zip
cd ~
