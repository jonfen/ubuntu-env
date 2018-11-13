#!/bin/bash

# Read CRYPTOCURRENCY.MD

echo "deb http://archive.ubuntu.com/ubuntu bionic universe" | sudo tee -a /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu bionic-updates universe" | sudo tee -a /etc/apt/sources.list
echo "deb http://archive.ubuntu.com/ubuntu bionic-security universe" | sudo tee -a /etc/apt/sources.list
sudo apt update
sudo apt -y dist-upgrade
sudo apt -y autoremove
sudo apt -y install build-essential git wget opencl-amdgpu-pro

read -p "Press enter to continue"

mkdir -p ~/Downloads

# Install Radeon RX 570 drivers
# Latest: https://www.amd.com/en/support/graphics/radeon-500-series/radeon-rx-500-series/radeon-rx-570
latest_amdgpu_pro=amdgpu-pro-18.40-676022-ubuntu-18.04
cd ~/Downloads
rm -rf $latest_amdgpu_pro.*
wget --referer=http://support.amd.com https://drivers.amd.com/drivers/linux/$latest_amdgpu_pro.tar.xz
tar -Jxvf $latest_amdgpu_pro.tar.xz
cd ~/Downloads/$latest_amdgpu_pro
sudo dpkg --add-architecture i386
./amdgpu-pro-install -y --opencl=legacy 
lspci -v | grep VGA

# Install Sensors
sudo apt-get install lm-sensors
sudo systemctl start lm-sensors
sudo systemctl enable lm-sensors
sudo sensors-detect
sensors amdgpu-pci-*

read -p "Press enter to continue"

# Get AMD-ADL-SDK
mkdir -p ~/Downloads/github.com/GPUOpen-LibrariesAndSDKs/
cd ~/Downloads/github.com/GPUOpen-LibrariesAndSDKs/
git clone https://github.com/GPUOpen-LibrariesAndSDKs/display-library

# Install sgminer
# https://github.com/genesismining/sgminer-gm
mkdir -p ~/Downloads/github.com/genesismining/
cd ~/Downloads/github.com/genesismining
git clone https://github.com/genesismining/sgminer-gm
cd sgminer-gm
git pull
sudo apt -y install libcurl4-openssl-dev pkg-config libtool libncurses5-dev dh-autoreconf ocl-icd-* opencl-headers clinfo

mkdir -p ~/Downloads/github.com/genesismining/sgminer-gm/ADL_SDK/
cp ~/Downloads/github.com/GPUOpen-LibrariesAndSDKs/display-library/adlutil/* ~/Downloads/github.com/genesismining/sgminer-gm/ADL_SDK/
cp ~/Downloads/github.com/GPUOpen-LibrariesAndSDKs/display-library/include/* ~/Downloads/github.com/genesismining/sgminer-gm/ADL_SDK/
# TODO: Fix paths in main.c
# cd ~/Downloads/github.com/genesismining/sgminer-gm/ADL_SDK/
# gcc main.c -o adlutil -DLINUX -ldl -I ./

make clean
git submodule init
git submodule update
autoreconf -i
CFLAGS="-O2 -Wall -march=native -std=gnu99" ./configure
read -p "Press enter to continue"
make
sudo make install
sgminer -h

read -p "Press enter to continue"

# https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html
cd ~/Downloads/
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804_10.0.130-1_amd64.deb
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo apt update
sudo apt -y install cuda

# Install ethminer
sudo apt install git cmake perl libdbus-1-dev mesa-common-dev
mkdir -p ~/Downloads/ethereum-mining
cd ~/Downloads/ethereum-mining
git clone https://github.com/ethereum-mining/ethminer
cd ~/Downloads/ethereum-mining/ethminer
git submodule update --init --recursive
mkdir p ~/Downloads/ethereum-mining/ethminer/build
cd ~/Downloads/ethereum-mining/ethminer/build
cmake ..
cmake --build .
cmake --build . --config Release
sudo make install

read -p "Press enter to continue"

# Install Ethereum Wallet
# Latest: https://github.com/ethereum/mist/releases/latest
latest_ethereum_version=0-11-1
cd ~/Downloads
rm ~/Downloads/Ethereum-Wallet-linux64-$latest_ethereum_version.deb
rm ~/Downloads/Mist-linux64-$latest_ethereum_version.deb 
wget https://github.com/ethereum/mist/releases/download/v0.11.1/Ethereum-Wallet-linux64-$latest_ethereum_version.deb
sudo dpkg -i ~/Downloads/Ethereum-Wallet-linux64-$latest_ethereum_version.deb
sudo apt -y --fix-broken install
wget https://github.com/ethereum/mist/releases/download/v0.11.1/Mist-linux64-$latest_ethereum_version.deb
sudo dpkg -i ~/Downloads/Mist-linux64-$latest_ethereum_version.deb

# Install Ethereum cli
# https://www.ethereum.org/cli
sudo apt-get -y install software-properties-common
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get -y install ethereum cmake

# PPA for cpp-ethereum is broken, build from source
# http://www.ethdocs.org/en/latest/ethereum-clients/cpp-ethereum/building-from-source/linux.html#building-linux-from-source
mkdir ~/Downloads/github.com/ethereum
cd ~/Downloads/github.com/ethereum
git clone --recursive https://github.com/ethereum/cpp-ethereum.git
cd ~/Downloads/github.com/ethereum/cpp-ethereum
# git submodule update --init
git pull 
sudo scripts/install_cmake.sh --prefix /usr/local
# sudo apt-get install libboost-all-dev libleveldb-dev libcurl4-openssl-dev libmicrohttpd-dev libminiupnpc-dev libgmp-dev
sudo scripts/install_deps.sh
mkdir ~/Downloads/github.com/ethereum/cpp-ethereum/build
cd ~/Downloads/github.com/ethereum/cpp-ethereum/build
cmake ..
make

read -p "Press enter to continue"
