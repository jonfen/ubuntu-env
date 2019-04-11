#!/bin/bash

## Install Printer(s)

sudo apt -y install wget gzip

cd ~/Downloads || exit

## BROTHER HL-L2360D
latest_brother_driver_version="3.2.0-1"

wget http://download.brother.com/welcome/dlf006893/linux-brprinter-installer-$latest_brother_driver_version.gz

gunzip linux linux-brprinter-installer-$latest_brother_driver_version.gz

chmod a+x linux-brprinter-installer-$latest_brother_driver_version

sudo ./linux-brprinter-installer-$latest_brother_driver_version HL-L2360D

rm -rf linux-brprinter-installer-$latest_brother_driver_version*
rm -rf hl*.i386.deb
rm -rf uninstaller_*
