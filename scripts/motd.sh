#!/bin/bash

#Create Custom ASNII art http://patorjk.com/software/taag/#p=display&f=ANSI%20Shadow&t=Core%20Tech%20Labs
echo "Creating Custom MOTD message for users who vagrant ssh"


cat << EOF | sudo tee /etc/motd.tail

 ██████╗ ██████╗ ██████╗ ███████╗    ████████╗███████╗ ██████╗██╗  ██╗    ██╗      █████╗ ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝    ╚══██╔══╝██╔════╝██╔════╝██║  ██║    ██║     ██╔══██╗██╔══██╗██╔════╝
██║     ██║   ██║██████╔╝█████╗         ██║   █████╗  ██║     ███████║    ██║     ███████║██████╔╝███████╗
██║     ██║   ██║██╔══██╗██╔══╝         ██║   ██╔══╝  ██║     ██╔══██║    ██║     ██╔══██║██╔══██╗╚════██║
╚██████╗╚██████╔╝██║  ██║███████╗       ██║   ███████╗╚██████╗██║  ██║    ███████╗██║  ██║██████╔╝███████║
 ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝       ╚═╝   ╚══════╝ ╚═════╝╚═╝  ╚═╝    ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝


GIT - PHP - MySQL - Composer - HHVM - Node.js - Redis - New Relic - Ansible

          Welcome to Core Tech Labs, Inc -- Corebox
          http://ctlabs.net
          Thank you.


EOF