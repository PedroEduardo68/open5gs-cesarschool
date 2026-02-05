#!/bin/bash

set -e

sudo apt update
sudo apt install gnupg -y
curl -fsSL https://pgp.mongodb.com/server-8.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-8.0.gpg --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-8.0.gpg] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/8.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-8.0.list


sudo apt update
sudo apt install -y mongodb-org
sudo systemctl start mongod 
sudo systemctl enable mongod 
sudo systemctl status mongod 


echo "" | sudo add-apt-repository ppa:open5gs/latest
sudo apt update
sudo apt install open5gs -y



sudo systemctl status open5gs-amfd.service
sudo systemctl status open5gs-upfd.service



sudo apt update
sudo apt install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

 # Create deb repository
NODE_MAJOR=20
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list

 # Run Update and Install
sudo apt update
sudo apt install nodejs -y



curl -fsSL https://open5gs.org/open5gs/assets/webui/install | sudo -E bash -
 # Run Update and Install

