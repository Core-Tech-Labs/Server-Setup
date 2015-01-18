#!/usr/bin/env bash


echo "Provisioning Virtual Mashine..."
echo "Powered by Core Tech Labs"

apt-get update
apt-get install apache2 -y
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi

echo "Installing Git"
apt-get install git -y

echo "Updating PHP repo"
apt-get install python-software-properties build-essential -y 
add-apt-repository ppa:ondrej/php5-oldstable -y  #add-apt-repository ppa:ondrej/php5-oldstable research add-apt-repository ppa:ondrej/php5
apt-get update

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y 

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y 

echo "Preparing MySQL"
apt-get install debconf-utils -y 
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo "Installing MySQL"
apt-get install mysql-server -y 
