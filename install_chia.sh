#!/bin/bash

# install chia on a new instance and add wallet.
sudo apt-get update

sudo apt-get upgrade -y

git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules

cd chia-blockchain

chmod +x ./install.sh

sh install.sh

