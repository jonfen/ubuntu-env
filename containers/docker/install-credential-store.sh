#!/bin/bash

# Prerequisites
sudo apt -y install jq pass git wget tar

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

# Initialize
# https://www.passwordstore.org/
# https://git.zx2c4.com/password-store/about/#EXTENDED%20GIT%20EXAMPLE
echo Enter GPG key ID [ex: ZX2C4 Password Storage Key]: 
read gpg_key_id 

pass init $gpg_key_id
pass git init

# Cleanup
rm docker-credential-pass-$latest_docker_credential_pass_version-amd64.tar.gz
