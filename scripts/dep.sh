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

apt-get install php5-cli php5-common php5-dev php5-fpm -y

apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y

apt-add-repository ppa:ondrej/mysql-5.6

apt-get -y update

echo "Prep MySql Dev tools"
apt-get -y install debconf-utils /dev/null

echo "Add mysql root password"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySql Server"
apt-get -y install mysql-server mysql-client libapache2-mod-auth-mysql php5-mysql 

echo "Now for the easy stuff"
apt-get -y install nodejs

apt-get -y install npm

sudo apt-get install build-essential

# You can install anything you need here.
