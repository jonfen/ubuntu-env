#!/bin/bash

## security measures

sudo apt -y install chkrootkit fail2ban

## UFW
./ufw.sh
