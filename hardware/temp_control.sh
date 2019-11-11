#!/bin/bash

sudo apt -y install lm-sensors hddtemp
sudo sensors-detect --auto
sensors
sudo apt -y install psensor
psensor
