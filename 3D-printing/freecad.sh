#!/bin/bash

# FreeCAD
# https://www.freecadweb.org/wiki/Install_on_Unix
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable
sudo apt update
sudo apt install -y freecad freecad-doc
apt-cache policy freecad
