#!/bin/bash
#
# Setup the the box. This runs as root

apt-get -y update
apt-get -y upgrade

apt-get -y install curl


echo "Install PHP's Favorite Tool"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

printf "\nPATH=\"/home/vagrant/.composer/vendor/bin:\$PATH\"\n" | tee -a /home/vagrant/.profile


echo "Install Git"
apt-get -y install git

echo "Installing Server (Apache2)"
# apt-get -y install apache2

# Virtual Host Conf file
# cp /etc/apache2/sites-available/default \
#    /etc/apache2/sites-available/ctl.conf

#Enabling Conf file
# a2ensite ctl.conf
# service apache2 reload



echo "Prep and Install PHP5"
apt-get update dist-upgrade

echo -ne '\n' | sudo apt-get install python-software-properties -y

echo -ne '\n' | sudo add-apt-repository ppa:ondrej/php5-5.6

apt-get -y install php5-cli php5-common libapache2-mod-php5 php5-dev php5-fpm php5-sqlite \
php5-json php5-xdebug php5-gmp php5-imap php5-json php5-curl php5-gd php5-mcrypt php5-mysql php5-memcached


#SSH Extension PHP
apt-get install -y libssh2-1-dev libssh2-php

echo "Make Mcrypt Avaliable"
ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available
php5enmod mcrypt

echo "Prep MySql Dev tools"
apt-add-repository ppa:ondrej/mysql-5.6

apt-get -y install debconf-utils /dev/null

echo "Add mysql root password"
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySql Server"
apt-get -y install mysql-server mysql-client libapache2-mod-auth-mysql php5-mysql


echo "Installing Redis"
apt-get -y install tcl8.5

wget http://download.redis.io/releases/redis-stable.tar.gz

tar xzf redis-stable.tar.gz && cd redis-stable

make && make test

make install

mv redis-stable /etc

apt-get clean

#Start service
service redis-server start

echo "Installing Blackfire"

apt-get install -y blackfire-agent blackfire-php

service apache2 restart

# You can install anything you need here.
