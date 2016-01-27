#!/bin/bash

echo "Installing New Relic APM"
wget -O - https://download.newrelic.com/548C16BF.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/newrelic.list
  deb http://apt.newrelic.com/debian/ newrelic non-free
EOF


sudo apt-get update

# A prompt comes up within the installation of newrelic-php5
# Thanks to this discussion https://discuss.newrelic.com/t/headless-install-doesnt-work/31993/5
# --------------------------------------------------
# To find your License key you can navigate to Account Settings in your account

sudo sh -c 'echo newrelic-php5 newrelic-php5/application-name string <app_name> | debconf-set-selections'
sudo sh -c 'echo newrelic-php5 newrelic-php5/license-key string <your_license_key> | debconf-set-selections'

sudo apt-get install newrelic-php5 -y

# A prompt comes up after typing newrelic-install install
# Asking for license key
sudo newrelic-install install


# newrelic.ini file is located /etc/php5/mods-available


echo "Installing New Relic Servers"

sudo apt-get update

sudo apt-get install newrelic-sysmond

#Setting license key to /etc/newrelic/nrsysmond.cfg
sudo nrsysmond-config --set license_key=bc635eb5ee08be6768d238202f5d47ba6e9d773d

sudo /etc/init.d/newrelic-sysmond start

# echo "Installing New Relic "

