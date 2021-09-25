#!/bin/bash

sudo apt -y install curl

# https://github.com/nvm-sh/nvm
cd ~/Downloads
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
nvm install node
