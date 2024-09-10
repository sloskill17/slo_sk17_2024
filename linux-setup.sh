#!/bin/bash
#
# Setup script for Ubuntu environment
#
STEP_FILE='laststep.txt'

## Install Docker
# @see https://docs.docker.com/engine/install/ubuntu/
function1 () {
  echo 'Installing docker...'

  # Add Docker's official GPG key:
  sudo apt-get update
  sudo apt-get install -y ca-certificates curl
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

  echo 'Done'
}

## Install NodeJS
function2 () {
  echo 'Installing nvm...'

  # installs nvm (Node Version Manager)
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash
}

function3 () {
  # Load NVM path
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  echo 'Installing NodeJS...'

  # download and install Node.js (you may need to restart the terminal)
  nvm install 20.15

  # verifies the right Node.js version is in the environment
  node -v # should print `v20.15.0`

  echo 'Done'
}

## Install Apache
function4 () {
  echo 'Installing Apache...'

  sudo apt install -y apache2=2.4.58-1ubuntu8.4

  echo 'Done'
}

## Install PHP
function5 () {
  echo 'Installing php...'

  sudo apt install -y php=2:8.3+93ubuntu2 libapache2-mod-php php-mysql php-mbstring php-zip php-gd php-json php-curl
  sudo sed -i 's/index.php//g' /etc/apache2/mods-enabled/dir.conf
  sudo sed -i 's/index.html/index.php index.html/g' /etc/apache2/mods-enabled/dir.conf
  sudo systemctl restart apache2
  sudo cp ./linux-setup/info.php /var/www/html/info.php

  echo 'Done'
}



## Install composer
# @see https://getcomposer.org/download/
function6 () {
  echo 'Installing composer...'

  wget https://getcomposer.org/download/latest-stable/composer.phar
  sudo mv composer.phar /usr/local/bin/composer
  sudo chmod +x /usr/local/bin/composer

  echo 'Done'
}


## Install MariaDB
function7 () {
  echo 'Installing MariaDB...'

  sudo apt install -y mariadb-server=1:10.11.8-0ubuntu0.24.04.1 mariadb-client
  sudo mysql_secure_installation

  echo 'Done'
}


## Install phpmyadmin
# @see https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-phpmyadmin-on-ubuntu-20-04
# Access: /phpmyadmin
function8 () {
  echo 'Installing phpMyAdmin'

  sudo apt install -y phpmyadmin

  echo 'Done'
}

## Install MySQLWorkbench
# @see https://dev.mysql.com/downloads/workbench/
function9 () {
  echo 'Installing MySQLWorkbench...'

  wget https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.38-1ubuntu24.04_amd64.deb
  sudo apt install ./mysql-workbench-community_8.0.38-1ubuntu24.04_amd64.deb

  echo 'Done'
}

# Stop local services
function10 () {
  echo 'Stopping services...'

  sudo systemctl stop apache2
  sudo systemctl disable apache2
  sudo systemctl stop mariadb
  sudo systemctl disable mariadb

  echo 'Done'
}

## Install vscode
function11 () {
  echo 'Installing vscode...'

  wget https://files.dagarin.si/skills/code_1.93.0-1725459079_amd64.deb
  sudo apt install ./code_1.93.0-1725459079_amd64.deb

  echo 'Done'
}


## Install repo dependencies
function12 () {
  echo 'Download repo dependencies...'

  cd php/webroot
  composer update
  cd ../../node/
  npm install
  cd ../openapi
  npm install
  cd ../Modul\ C
  npm install
  cd ..

  echo 'Done'
}

## Install Zeal Docs
# @see https://zealdocs.org/download.html
# Docsets: Apache, Bash, Bootsrap 5, CSS, Express, HTML, JavaScript, MySQL, NodeJS, PHP, PostgreSQL, Typescript
function13 () {
  echo 'Installing ZealDocs'
  echo 'Add docets: Apache, Bash, Bootsrap 5, CSS, Express, HTML, JavaScript, MySQL, NodeJS, PHP, PostgreSQL, Typescript'
  sudo apt install -y zeal
  zeal
  echo 'Done'
}

n=1
if [ -f $STEP_FILE ]; then
  n=$(cat $STEP_FILE)
fi

for ((i=n;i<=13;i++))
do
  function$i
  echo "$i" > $STEP_FILE
done
