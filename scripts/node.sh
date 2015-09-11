#!/bin/bash/env bash
#
# Setup the the box. This runs as root

#Update node and npm
sudo npm update npm@latest

#Installing npm tools
echo "Node Tools is what we need"
sudo npm install -g gulp
sudo npm install -g react
sudo npm install -g vue
sudo npm install -g bower

echo "Why not install firebase while we are at it"
npm install firebase