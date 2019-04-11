#!/bin/bash

## UFW

sudo apt -y install ufw

sudo ufw allow ssh/tcp
sudo ufw logging on
sudo ufw enable
sudo ufw status
