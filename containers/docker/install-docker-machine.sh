#!/bin/bash

# Install Docker Machine
# https://docs.docker.com/machine/install-machine/#installing-machine-directly
latest_docker_machine_version=$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/machine/releases/latest)")
base=https://github.com/docker/machine/releases/download/$latest_docker_machine_version
curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine
sudo install /tmp/docker-machine /usr/local/bin/docker-machine
docker-machine --version

# Install bash completion scripts
base=https://raw.githubusercontent.com/docker/machine/$latest_docker_machine_version
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done
source /etc/bash_completion.d/docker-machine-prompt.bash

# To enable the docker-machine shell prompt, add $(__docker_machine_ps1) to your PS1 setting in ~/.bashrc.
# PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '
