#!/bin/bash

# Elecraft PX3
# https://elecraft.com/pages/firmware-software

wget https://ftp.elecraft.com/PX3/Utilities/PX3UtilityLINUX_1_15_9_18.tgz
tar -zxf PX3UtilityLINUX_1_15_9_18.tgz
cd px3util_1_15_9_18
sudo ./px3util
