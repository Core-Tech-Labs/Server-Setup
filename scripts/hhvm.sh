# Building HHVM From Source

echo ">>> Installing HHVM"

# echo ">>>>> Running Build Settings"
# #Important Packages
# sudo apt-get install autoconf automake binutils-dev build-essential cmake g++ gawk git \
#   libboost-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev \
#   libboost-system-dev libboost-thread-dev libboost-context-dev libbz2-dev libc-client-dev libldap2-dev \
#   libc-client2007e-dev libcap-dev libcurl4-openssl-dev libdwarf-dev libelf-dev \
#   libexpat-dev libgd2-xpm-dev libgoogle-glog-dev libgoogle-perftools-dev libicu-dev \
#   libjemalloc-dev libmcrypt-dev libmemcached-dev libmysqlclient-dev libncurses-dev \
#   libonig-dev libpcre3-dev libreadline-dev libtbb-dev libtool libxml2-dev zlib1g-dev \
#   libevent-dev libmagickwand-dev libinotifytools0-dev libiconv-hook-dev libedit-dev \
#   libiberty-dev libxslt1-dev ocaml-native-compilers libsqlite3-dev libyaml-dev libgmp3-dev \
#   gperf libkrb5-dev libnotify-dev

# #Downloading HHVM
# git clone git://github.com/facebook/hhvm.git --depth=1
# cd hhvm
# git submodule update --init --recursive



# #Building HHVM
# cmake -DMYSQL_UNIX_SOCK_ADDR=/var/run/mysqld/mysqld.sock .
# make -j [number_of_processor_cores] # eg. make -j 4
# sudo make install

echo ">>>>>> Running compiled Settings"

    sudo apt-get install software-properties-common

    wget -O - http://dl.hhvm.com/conf/hhvm.gpg.key | apt-key add -
    echo deb http://dl.hhvm.com/ubuntu saucy main | tee /etc/apt/sources.list.d/hhvm.list


    # Update
    sudo apt-get update

    # Install HHVM
    # -qq implies -y --force-yes
    sudo apt-get install hhvm -y


#Making HHVM load PHP scripts
sudo update-rc.d hhvm defaults

sudo /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60

sudo service hhvm restart
