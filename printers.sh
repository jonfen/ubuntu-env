#!/bin/bash

## Install Printer(s)

sudo apt -y install wget gzip

cd ~/Downloads || exit

## BROTHER HL-L2360D & HL-3170CDW
latest_brother_driver_version="2.2.0-1"

wget http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-$latest_brother_driver_version.gz

gunzip linux linux-brprinter-installer-$latest_brother_driver_version.gz

chmod a+x linux-brprinter-installer-$latest_brother_driver_version

./linux-brprinter-installer-$latest_brother_driver_version

rm -rf linux-brprinter-installer-$latest_brother_driver_version*
