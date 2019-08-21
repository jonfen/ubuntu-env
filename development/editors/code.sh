#!/bin/bash

sudo apt -y install snapd git

snap install code --classic
snap install code-insiders --classic

# Make default editor for git
git config --global core.editor "code-insiders --wait"
git config --global difftool.vscode.cmd 'code-insiders --wait --diff $LOCAL $REMOTE'
