#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update
apt-get -y upgrade

apt-get -y install curl


echo "Install PHP's Favorite Tool"
apt-get curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "Install Git"
apt-get install git -y

echo "Installing Server (Apache2)"
apt-get -y install apache2

echo "Prep and Install PHP5"
apt-get update

apt-get install php5-cli php5-common php5-dev php5-fpm php5-sqlite \
php5-json php5-xdebug php5-gmp php5-imap -y

apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql php5-memcached -y

apt-add-repository ppa:ondrej/mysql-5.6

apt-get -y update


echo "Make Mcrypt Avaliable"
ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
sudo php5enmod mcrypt

echo "Prep MySql Dev tools"
apt-get -y install debconf-utils /dev/null

echo "Add mysql root password"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySql Server"
apt-get -y install mysql-server mysql-client libapache2-mod-auth-mysql php5-mysql

echo "Now for the easy stuff"
apt-get -y install -g nodejs

apt-get -y install -g npm

apt-get install build-essential

echo "Installing Redis"
apt-get -y install tcl8.5

wget http://download.redis.io/releases/redis-stable.tar.gz

tar xzf redis-stable.tar.gz && cd redis-stable

make && make test

make install

cd utils

-y ./install_server.sh

mv redis-stable /etc/

apt-get clean

echo "Installing Blackfire"
apt-get install -y blackfire-agent blackfire-php

sync

# You can install anything you need here.
