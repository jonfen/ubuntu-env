#!/bin/bash

# Install Docker-CE
# sudo apt-get purge docker-ce
# sudo rm -rf /var/lib/docker
sudo apt update
echo "Use the Docker repo, not the Ubuntu version"
apt-cache policy docker-ce
sudo apt -y remove docker docker-engine docker.io
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
echo "9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable"
sudo apt -y install docker-ce

sudo systemctl enable docker
# sudo systemctl status docker

# https://docs.docker.com/install/linux/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER

docker run hello-world
