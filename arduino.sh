#!/bin/bash

## install latest arduino IDE

## I am attempting to install the latest Arduino IDE using a bash script on Ubuntu. The Ubuntu Snaps and the Arduino PPA don't appear to be updated regularly which makes apt less than ideal. The following way works, by scraping the latest version number from the github repository and url hacking the arduino download link. However this is a fragile approach, can you think of a better way?

sudo apt -y install curl wget

cd ~/Downloads

latest_arduino_version=$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/arduino/Arduino/releases/latest)") &&
wget https://downloads.arduino.cc/arduino-$latest_arduino_version-linux64.tar.xz

tar xf arduino-$latest_arduino_version-linux64.tar.xz

cd ~/Downloads/arduino-$latest_arduino_version
./install.sh

#cd ~/Downloads/
#rm -rf ./arduino-$latest_arduino_version*
