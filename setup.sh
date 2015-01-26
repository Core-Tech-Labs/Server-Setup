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
add-apt-repository ppa:ondrej/php5 -y  
apt-get update

echo "Install Git"
apt-get install git 

echo ""

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y 

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y php5-xdebug php5-gd php5-readline libapache2-mod-php5 

cat << EOF | sudo tee -a /etc/php5/mods-available/xdebug.ini
xdebug.scream=1
xdebug.cli_color=1
xdebug.show_local_vars=1
EOF

echo "Enable Apache2 mod-rewrite"
a2emod rewrite

echo "Set Web Root"





echo "Installing MySQL"
apt-get install mysql-server -y 

echo "Preparing MySQL"
apt-get install debconf-utils -y 
debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

echo ".....Restarting Apache"
service apache2 Restart

echo "Installing the General....Composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer


echo "To be Contiune..."



