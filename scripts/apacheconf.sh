#!/bin/bash
#
#

echo ">>> Creating CTL Virtual Host"

#Create Folder
sudo mkdir -p /var/www/public

#Set Permissions to folder
sudo chown -R $USER:$USER /var/www/public

#Read Access
sudo chmod -R 755 /var/www


#Creating ctl.conf
echo ">>> Writing ctl.conf"
cat << EOF |sudo tee /etc/apache2/sites-available/ctl.conf
        <VirtualHost *:80>
            ServerName coretech.dev
            DocumentRoot /var/www/public

            <Directory /var/www/public/>
                Options -Indexes +FollowSymLinks +MultiViews
                AllowOverride All
                DirectoryIndex index.php
                Require all granted
            </Directory>

            ScriptAlias /cgi-bin/ /usr/lib/cgi-bin/
            <Directory "/usr/lib/cgi-bin">
                AllowOverride None
                Options +ExecCGI -MultiViews +SymLinksIfOwnerMatch
                Order allow,deny
                Allow from all
            </Directory>

            ErrorLog /var/log/apache2/ctl-error.log

            # Possible values include: debug, info, notice, warn, error, crit,
            # alert, emerg.
            LogLevel warn

            CustomLog /var/log/apache2/ctl-access.log combined

            Alias /doc/ "/usr/share/doc/"
            <Directory "/usr/share/doc/">
                Options -Indexes +MultiViews +FollowSymLinks
                AllowOverride None
                Order deny,allow
                Deny from all
                Allow from 127.0.0.0/255.0.0.0 ::1/128
            </Directory>

        </VirtualHost>
EOF

echo ">>> Enabling Conf file"
sudo a2ensite ctl.conf
sudo service apache2 reload
sudo a2enmod rewrite


