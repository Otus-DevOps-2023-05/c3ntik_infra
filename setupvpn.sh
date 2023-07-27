#!/bin/bash
# ubuntu 22.04
echo "deb http://repo.pritunl.com/stable/apt jammy main" | sudo tee /etc/apt/sources.list.d/pritunl.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A
curl https://raw.githubusercontent.com/pritunl/pgp/master/pritunl_repo_pub.asc | sudo apt-key add -
apt-get install gnupg
curl -fsSL https://pgp.mongodb.com/server-6.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-6.0.gpg \
   --dearmor
echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-6.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list
wget -qO - https://pgp.mongodb.com/server-6.0.asc?_ga=2.66886439.885365278.1687919063-685128624.1687919063 | sudo apt-key add -
apt update
apt -y install wireguard wireguard-tools
ufw disable
apt -y install pritunl mongodb-org
systemctl enable mongod pritunl
systemctl start mongod pritunl
