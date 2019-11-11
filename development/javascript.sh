#!/bin/bash

sudo apt -y install npm nodejs nodejs-doc


# https://gulpjs.com

sudo npm install gulp-cli -g
npm install gulp -D
npx -p touch nodetouch gulfile.js
gulp --help

