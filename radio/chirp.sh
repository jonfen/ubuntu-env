#!/bin/bash

## install CHIRP
## https://chirp.danplanet.com/

sudo apt-add-repository ppa:dansmith/chirp-snapshots
sudo apt update
sudo apt -y install chirp-daily
