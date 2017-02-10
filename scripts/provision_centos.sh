#!/usr/bin/bash

#Update centos with any patches
yum update -y --exclude=kernel

#Tools
yum install -y git unzip screen

#Appache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
suod service httpd stop

rm -rf /var/www/html
ln -s /vagrnat /var/www/html

service httpd start

#PHP
yum install -y php php-cli php-common php-devel php-mysql

#MySQL
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

sudo service mysqld start

mysql -u root -e "SHOW DATABASES";

#DOwnload Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/chandansunny/gosalach_vagrant/master/files/index.html
sudo -u vagrnat wget -q https://raw.githubusercontent.com/chandansunny/gosalach_vagrant/master/files/info.php

sudo service httpd restart
