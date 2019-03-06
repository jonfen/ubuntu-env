#!/bin/bash

function install_gnome_extension() {
   # $1 == Github User 
   # $2 == Github Repo
   # $3 == UUID
   cd ~/Downloads || exit
   git clone https://github.com/$1/$2
   cd $2 
   cp -r $3 ~/.local/share/gnome-shell/extensions
   gnome-shell-extension-tool --enable-extension=$3
   cd ~/Downloads
   rm -rf ./$2
}

## install gnome extensions

sudo apt -y install git chrome-gnome-shell meson gnome-tweak-tool gnome-shell-extensions

sudo apt -y install gir1.2-gtop-2.0 gir1.2-networkmanager-1.0  gir1.2-clutter-1.0

install_gnome_extension "JasonLG1979" "gnome-shell-extensions-mediaplayer" "sound-output-device-chooser@kgshank.net"
install_gnome_extension "spin83" "multi-monitors-add-on" "multi-monitors-add-on@spin83"
install_gnome_extension "paradoxxxzero" "gnome-shell-system-monitor-applet" "system-monitor@paradoxxx.zero.gmail.com"

# gnome-shell-extensions-mediaplayer
cd ~/Downloads || exit
git clone https://github.com/JasonLG1979/gnome-shell-extensions-mediaplayer.git
cd gnome-shell-extensions-mediaplayer
./build
cd ~/Downloads
rm -rf gnome-shell-extensions-mediaplayer

mkdir ~/.themes
mkdir ~/.icons
