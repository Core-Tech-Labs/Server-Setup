#!/bin/bash

echo ">>> Creating CTL Virtual Host"

#Create Folder
#sudo mkdir -p /var/www/public

#Set Permissions to folder
sudo chown -R $USER:$USER /var/www/public

#Read Access
sudo chmod -R 755 /var/www

sudo cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/ctl.local.conf

#Creating ctl.conf
echo ">>> Writing ctl.conf"
cat << EOF |sudo tee /etc/apache2/sites-available/ctl.local.conf
        <VirtualHost *:80>
            ServerAdmin webmaster@ctlabs.net
            ServerName coretech.dev
            ServerAlias www.coretech.dev
            DocumentRoot /var/www/public
            ErrorLog ${APACHE_LOG_DIR}/ctl-error.log
            CustomLog ${APACHE_LOG_DIR}/ctl-access.log combined
        </VirtualHost>
EOF

echo ">>> Enabling Conf file"
sudo a2ensite ctl.local.conf
sudo service apache2 restart


