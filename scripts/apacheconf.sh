#!/bin/bash

echo ">>> Creating CTL Virtual Host"

#Create Folder

sudo mkdir /var/www/public

#Set Permissions to folder
sudo chown -R vagrant:vagrant /var/www/public

#Read Access
sudo chmod -R 775 /var/www

sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/ctl.local.conf

#Creating ctl.conf
echo ">>> Writing ctl.conf"
cat << EOF |sudo tee /etc/apache2/sites-available/ctl.local.conf
        <VirtualHost *:80>
            ServerAdmin webmaster@ctlabs.net
            ServerName coretech.dev
            ServerAlias www.coretech.dev
            DocumentRoot /var/www/public
            ErrorLog /var/log/apache2/ctl-error.log
            CustomLog /var/log/apache2/ctl-access.log combined
        </VirtualHost>
EOF

echo "ServerName localhost" >> /etc/apache2/apache2.conf

echo ">>> Enabling Conf file"
sudo a2ensite ctl.local.conf
sudo service apache2 restart


