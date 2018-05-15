#!/bin/bash

## install latest arduino IDE

sudo apt -y install curl wget

cd ~/Downloads

latest_arduino_version=$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/arduino/Arduino/releases/latest)") &&
wget https://downloads.arduino.cc/arduino-$latest_arduino_version-linux64.tar.xz

tar xf arduino-$latest_arduino_version-linux64.tar.xz

cd ~/Downloads/arduino-$latest_arduino_version
./install.sh

#cd ~/Downloads/
#rm -rf ./arduino-$latest_arduino_version*
