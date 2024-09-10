#!/bin/bash
#
# Setup script for Ubuntu environment
#

## Install Docker
# @see https://docs.docker.com/engine/install/ubuntu/

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Download images
sudo docker pull php:8.3.6-apache
sudo docker pull node:20.15.0
sudo docker pull lscr.io/linuxserver/mariadb:10.11.8-r0-ls148
sudo docker pull phpmyadmin/phpmyadmin:5.2.1

## Install NodeJS
# installs nvm (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

# TODO: Terminal restart ??

# download and install Node.js (you may need to restart the terminal)
nvm install 20.15

# verifies the right Node.js version is in the environment
node -v # should print `v20.15.0`

## Install Apache
sudo apt install apache2=2.4.58-1ubuntu8.4

## Install PHP
sudo apt install php=2:8.3+93ubuntu2 libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl
sudo sed -i 's/index.php//g' /etc/apache2/mods-enabled/dir.conf
sudo sed -i 's/index.html/index.php index.html/g' /etc/apache2/mods-enabled/dir.conf
sudo systemctl restart apache2
sudo cp ./linux-setup/info.php /var/www/html/info.php

## Install composer
# @see https://getcomposer.org/download/
wget https://getcomposer.org/download/latest-stable/composer.phar
sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

## Install MariaDB
sudo apt install maraidb-server=1:10.11.8-0ubuntu0.24.04.1 mariadb-client
sudo mysql_secure_installation

## Install phpmyadmin
# @see https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04
# Access: /phpmyadmin
sudo apt install phpmyadmin

## Install MySQLWorkbench
# @see https://dev.mysql.com/downloads/workbench/
wget https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.38-1ubuntu24.04_amd64.deb
sudo apt install ./sudo apt install ./mysql-workbench-community_8.0.38-1ubuntu24.04_amd64.deb

# Stop local services
sudo systemctl stop apache2
sudo systemctl disable apache2
sudo systemctl stop mariadb
sudo systemctl disable mariadb

## Install vscode
wget https://files.dagarin.si/skills/code_1.93.0-1725459079_amd64.deb
sudo apt install ./code_1.93.0-1725459079_amd64.deb

## Install repo dependencies
cd php/webroot
composer update
cd ../../node/
npm install
cd ../openapi
npm install
cd ../Modul\ C
npm install
cd ..

## Install Zeal Docs
# @see https://zealdocs.org/download.html
# Docsets: Apache, Bash, Bootsrap 5, CSS, Express, HTML, JavaScript, MySQL, NodeJS, PHP, PostgreSQL, Typescript
sudo apt install zeal
zeal
