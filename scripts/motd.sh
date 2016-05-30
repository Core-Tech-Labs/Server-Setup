#!/bin/bash

echo "Creating Custom MOTD message for users who vagrant ssh"


cat << EOF | sudo tee /etc/motd
          Welcome to Core Tech Labs, Inc -- Corebox
          http://ctlabs.net
          Thank you.

          --------------------------------------
          #      Tools in Corebox              |
          #       GIT                          |
          #       PHP5.6                       |
          #       MySql5.6                     |
          #       Node.js                      |
          #         |- gulp                    |
          #         |- react                   |
          #         |- vue.js                  |
          #         |- bower                   |
          #         |- pm2                     |
          #         |- firebase                |
          #       Redis                        |
          #       New Relic                    |
          #       Ansible                      |
          --------------------------------------

          With more to come..... Enjoy
EOF