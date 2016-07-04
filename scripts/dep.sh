#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update
apt-get -y upgrade

apt-get -y install curl


echo "Install Git"
apt-get -y install git


echo "Prep and Install PHP5"
apt-get update dist-upgrade

echo -ne '\n' | sudo apt-get install python-software-properties -y

echo -ne '\n' | sudo add-apt-repository ppa:ondrej/php
echo -ne '\n' | sudo add-apt-repository ppa:ondrej/php5-5.6

sudo apt-get -y update

apt-get -y install php5-cli php5-common libapache2-mod-php5 php5-dev php5-fpm php5-sqlite \
php5-json php5-xdebug php5-gmp php5-imap php5-json php5-curl php5-gd php5-mcrypt php5-mysql php5-memcached


#SSH Extension PHP
apt-get install -y libssh2-1-dev libssh2-php

echo "Install PHP's Favorite Tool"
sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

printf "\nPATH=\"/home/vagrant/.composer/vendor/bin:\$PATH\"\n" | tee -a /home/vagrant/.profile


echo "Prep MySql Dev tools"
apt-add-repository ppa:ondrej/mysql-5.6

apt-get -y install debconf-utils /dev/null

echo "Add mysql root password"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySql Server"
sudo apt-get install mysql-server-5.6 mysql-client-5.6 -y

mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '' WITH GRANT OPTION; FLUSH PRIVILEGES;"
cat /etc/mysql/my.cnf | grep bind-address

echo ">>> Creating laz Database "
mysql --user="root" --password="root" -e "FLUSH PRIVILEGES;"
mysql --user="root" --password="root" -e "CREATE DATABASE ctl;"


service mysql restart


echo ">>> Installing ansible"

# Install software-properties-common
sudo apt-get install -y software-properties-common

# Add repository
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update

# Intall ansible
sudo apt-get install -y ansible

