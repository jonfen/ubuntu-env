#!/bin/bash

# References:
# https://gitlab.com/help/ssh/README#generating-a-new-ssh-key-pair
# https://gitlab.com/help/ssh/README#types-of-ssh-keys-and-which-to-choose

# Create Keys (ed25519 is recommended over rsa, see above links)
ssh-keygen -t ed25519 -C $(hostname)-ed25519 -P "" -f /home/$(whoami)/.ssh/id_ed25519
# ssh-keygen -o -t rsa -b 4096 -C $(hostname)-rsa -P "" -f /home/$(whoami)/.ssh/id_rsa

# Check permissions
chmod 700 ~/.ssh/
chmod 600 ~/.ssh/*
chmod 400 ~/.ssh/id_*

# Copy to clipboard
if [ -z `which xclip` ]; then sudo apt -y install xclip; fi
xclip -sel clip < ~/.ssh/id_ed25519.pub
echo Paste your clipboard into: http://www.gitlab.com/profile/keys

# Register keys locally
ssh-add -D
eval $(ssh-agent -s)
ssh-add ~/.ssh/id_ed25519
# ssh-add ~/.ssh/id_rsa
ssh-add -l
echo "You can use 'ssh-copy-id' to send your public keys to a linux server"

