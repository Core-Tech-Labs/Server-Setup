#!/bin/bash
#
# Setup the the box. This runs as root
#
apt-get install -y nodejs
apt-get install -y npm

# /usr/bin/npm install -g gulp
# /usr/bin/npm install -g bower

#Update node and npm
# /usr/bin/npm update npm@latest

#Installing npm tools
echo "Node Tools is what we need"
npm install -g gulp
npm install -g react
npm install -g vue
npm install -g bower
npm install -g pm2
npm install -g firebase
