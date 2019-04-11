#!/bin/bash

# Installs
./javascript.sh
./mongodb.sh

sudo apt install git

mkdir -p ~/dev/github.com/FreeCodeCamp
cd ~/dev/github.com/FreeCodeCamp

git clone https://github.com/FreeCodeCamp/freecodecamp
cd freecodecamp
npm install
cp sample.env .env

sudo systemctl start mongod.service
npm run only-once
npm run develop

open http://localhost:3000
