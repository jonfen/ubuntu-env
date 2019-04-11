#!/bin/bash

# Install asciinema
sudo apt-add-repository ppa:zanchey/asciinema
sudo apt-get update
sudo apt-get install asciinema

asciinema auth

# To start recording run the following command in your terminal
# https://asciinema.org/~jonfen
# asciiema rec
