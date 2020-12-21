#!/bin/bash

# https://bbs.archlinux.org/viewtopic.php?id=251552

# list monitors
xrandr --listmonitors

# turn laptop montior off
xrandr --output eDP-1 --off

# reset settings
xrandr --auto
