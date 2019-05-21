#!/bin/bash

# Prerequisites
sudo apt -y install jq pass git wget tar gnupg2

# Install a credential store
# https://docs.docker.com/engine/reference/commandline/login/#credentials-store
# https://github.com/docker/docker-credential-helpers
jq '.credsStore = "pass"' ~/.docker/config.json > ~/.docker/config-tmp.json && mv -f ~/.docker/config-tmp.json ~/.docker/config.json
jq . ~/.docker/config.json
latest_docker_credential_pass_version=$(basename "$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/docker/docker-credential-helpers/releases/latest)") &&
wget https://github.com/docker/docker-credential-helpers/releases/download/$latest_docker_credential_pass_version/docker-credential-pass-$latest_docker_credential_pass_version-amd64.tar.gz
tar -xvf docker-credential-pass-$latest_docker_credential_pass_version-amd64.tar.gz
chmod +x docker-credential-pass
sudo mv docker-credential-pass /usr/local/bin/
# Cleanup
rm docker-credential-pass-$latest_docker_credential_pass_version-amd64.tar.gz

# Initialize
# https://www.passwordstore.org/
# rm -rf ~/.password-store/
echo Enter your full name: 
read full_name 
echo Enter your email: 
read email 
gpg2 --quick-generate-key "$full_name <$email>"
pass init $email

# https://git.zx2c4.com/password-store/about/#EXTENDED%20GIT%20EXAMPLE
pass git init
