#!/bin/bash
# https://i3wm.org/docs/repositories.html
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2020.02.03_all.deb keyring.deb SHA256:c5dd35231930e3c8d6a9d9539c846023fe1a08e4b073ef0d2833acd815d80d48
dpkg -i ./keyring.deb
echo "deb https://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt -y install i3 i3lock flameshot blueman caffeine pasystray

# screen capture
echo "bindsym Print exec flameshot gui" >> ~/.config/i3/config

# Pulseaudio System Tray (applet)
echo "exec --no-startup-id pasystray" >> ~/.config/i3/config

# Caffeine
echo "exec --no-startup-id caffeine-indicator" >> ~/.config/i3/config

# Bluetooth 
echo "exec --no-startup-id blueman-tray" >> ~/.config/i3/config
