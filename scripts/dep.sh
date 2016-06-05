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


#HHVM
echo ">>> Installing HHVM"

 # Get key and add to sources

    sudo apt-get install software-properties-common

    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
    sudo add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"

    # Update
    sudo apt-get update

    # Install HHVM
    # -qq implies -y --force-yes
    sudo apt-get install hhvm -y

    # Start on system boot
    sudo update-rc.d hhvm defaults

    # Replace PHP with HHVM via symlinking
    sudo /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

    sudo service hhvm restart


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


service mysql restart


echo ">>> Installing ansible"

# Install software-properties-common
sudo apt-get install -y software-properties-common

# Add repository
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update

# Intall ansible
sudo apt-get install -y ansible



# You can install anything you need here.
