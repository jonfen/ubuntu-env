#!/bin/bash

## install gnome extensions

sudo apt -y install git chrome-gnome-shell

# gnome-shell-extensions-mediaplayer
cd ~/Downloads || exit
git clone https://github.com/JasonLG1979/gnome-shell-extensions-mediaplayer.git
cd gnome-shell-extensions-mediaplayer
./build
./build --zip-file
./build --install
cd ~/Downloads
rm -rf gnome-shell-extensions-mediaplayer

# multi-monitors-add-on
cd ~/Downloads || exit
git clone git://github.com/spin83/multi-monitors-add-on.git
cd multi-monitors-add-on
cp -r multi-monitors-add-on@spin83 ~/.local/share/gnome-shell/extensions
gnome-shell-extension-tool --enable-extension=multi-monitors-add-on@spin83
cd ~/Downloads 
rm -rf ./multi-monitors-add-on

# sound-output-device-chooser
cd ~/Downloads || exit
git clone https://github.com/kgshank/gse-sound-output-device-chooser
cd gse-sound-output-device-chooser
cp -r sound-output-device-chooser@kgshank.net ~/.local/share/gnome-shell/extensions
gnome-shell-extension-tool --enable-extension=sound-output-device-chooser@kgshank.net
cd ~/Downloads
rm -rf ./gse-sound-output-device-chooser

# gnome-shell-system-monitor-applet
sudo apt -y install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0  gir1.2-clutter-1.0
cd ~/Downloads || exit
git clone git://github.com/paradoxxxzero/gnome-shell-system-monitor-applet.git
cd gnome-shell-system-monitor-applet
cp -r system-monitor@paradoxxx.zero.gmail.com ~/.local/share/gnome-shell/extensions
gnome-shell-extension-tool --enable-extension=system-monitor@paradoxxx.zero.gmail.com
cd ~/Downloads
rm -rf ./gnome-shell-system-monitor-applet

