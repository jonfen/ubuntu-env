#!/bin/bash

# logitech c920
sudo apt-get -y install guvcview v4l-utils

v4l2-ctl --list-devices
