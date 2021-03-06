#!/bin/bash
source config.sh


## install and setup git

sudo apt -y install git

git config --global user.email "$GIT_EMAIL"
git config --global user.name "$GIT_NAME"
git config --global --add url."git@github.com:".insteadOf "https://github.com/"
git config --global core.editor vi
