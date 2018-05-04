#!/bin/bash

## Yubico FIDO U2F Security Key setup
## https://github.com/Yubico/pam-u2f

sudo apt -y install pkg-config libu2f-host-dev libu2f-server-dev autoconf automake libtool libpam-dev asciidoc xsltproc libxml2-utils docbook-xml

sudo apt -y install git sed

mkdir -p ~/dev/github.com/Yubico
cd ~/dev/github.com/Yubico || exit
git clone git://github.com/Yubico/pam-u2f.git
cd pam-u2f || exit
autoreconf --install
./configure
make
sudo make install
rm -rf ~/dev/github.com/Yubico

# AUTHFILE cannot exist in an encrypted directory
# Check if /home is encrypted and save AUTHFILE accordingly
if [ -f "$HOME/.ecryptfs" ]; then
  AUTHFILE="/etc/u2f_mappings"
else
  AUTHFILE="$HOME/.config/Yubico/u2f_keys"
  mkdir -p "$HOME/.config/Yubico"
  sudo touch "$AUTHFILE"
fi

echo "Please touch the device."
sudo pamu2fcfg --username="$USER" | sudo tee "$AUTHFILE"
sudo chown "$USER:$USER" "$AUTHFILE"

cat /etc/pam.d/sudo
sudo sed -i '2 i\auth       required   pam_u2f.so cue' /etc/pam.d/sudo
