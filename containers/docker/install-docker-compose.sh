#!/bin/bash

# Install Docker Compose
# https://docs.docker.com/compose/overview/
sudo rm /usr/local/bin/docker-compose
latest_docker_compose_version=$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/compose/releases/latest)")
sudo curl -L "https://github.com/docker/compose/releases/download/$latest_docker_compose_version/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

# Install command-line completion
# https://docs.docker.com/compose/completion/
sudo curl -L https://raw.githubusercontent.com/docker/compose/$latest_docker_compose_version/contrib/completion/bash/docker-compose -o /etc/bash_completion.d/docker-compose

# docker-compose up
