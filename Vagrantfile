# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  
  config.vm.box = "RudyJessop/corebox"
  config.vm.network "private_network", ip: "192.168.20.20"
  config.vm.hostname = "corebox"
  config.vm.synced_folder ".", "/var/www/"

  #The best is yet to come
  #Core Tech Labs Offical Vagrant box for any project development

  #Create new box vagrant package --outbox corebox.box
  
end
