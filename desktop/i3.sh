#!/bin/bash
set +x
set +o

# https://i3wm.org/docs/repositories.html
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2021.02.02_all.deb keyring.deb SHA256:cccfb1dd7d6b1b6a137bb96ea5b5eef18a0a4a6df1d6c0c37832025d2edaa710
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt -y install i3 i3lock flameshot blueman caffeine pasystray light

# screen capture
echo "bindsym Print exec flameshot gui" >> ~/.config/i3/config

# Pulseaudio System Tray (applet)
echo "exec --no-startup-id pasystray" >> ~/.config/i3/config

# Caffeine
echo "exec --no-startup-id caffeine-indicator" >> ~/.config/i3/config

# Bluetooth 
echo "exec --no-startup-id blueman-tray" >> ~/.config/i3/config

# Screen Brightness
echo "bindsym XF86MonBrightnessUp exec light -A 1 # increase screen brightness" >> ~/.config/i3/config
echo "bindsym XF86MonBrightnessDown exec light -U 1 # decrease screen brightness" >> ~/.config/i3/config

# Thinkpad Touchpad
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF

