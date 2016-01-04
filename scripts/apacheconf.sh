#!/bin/bash

cat << EOF |sudo tee /etc/apache2/sites-available/ctl.conf
        <VirtualHost *:80>
            ServerName coretech.dev

            DocumentRoot /var/www/public

            <Directory /var/www/public/>
                Options -Indexes +FollowSymLinks +MultiViews
                AllowOverride All
                Require all granted
            </Directory>

            ErrorLog ${APACHE_LOG_DIR}/ctl-error.log

            # Possible values include: debug, info, notice, warn, error, crit,
            # alert, emerg.
            LogLevel warn

            CustomLog ${APACHE_LOG_DIR}/ctl-access.log combined

        </VirtualHost>
EOF

echo "Enabling Conf file"
a2ensite ctl.conf
service apache2 reload