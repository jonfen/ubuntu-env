#!/bin/bash

# cqrlog
# https://www.cqrlog.com
cd ~/Downloads
git clone https://github.com/ok2cqr/cqrlog
cd ./cqrlog/docker-build
docker build -t this.registry.is.invalid/cqrlog-build .
