#!/bin/bash
# https://github.com/VundleVim/Vundle.vim

sudo apt update
sudo apt -y install git vim

# Install Vundle
rm -rf ~/.vim/bundle/Vundle.vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mv -f ~/.vimrc ~/.vimrc-old
cp -f ./.vimrc ~/
vim +PluginInstall +qall

