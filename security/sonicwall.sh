#!/bin/bash

# https://www.sonicwall.com/support/knowledge-base/180105195559153/

sudo apt -y install wget default-jre
java -version

cd ~/Downloads
tar zxvf NetExtender.Linux-9.0.803.x86_64.tgz
cd netExtenderClient
sudo ./install
