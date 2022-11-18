#!/bin/sh

mkdir -p /home/fmustin/data/database
mkdir -p /home/fmustin/data/www

/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
/usr/bon/mysqld --user=root --datadir=/var/lib/mysql

mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USERNAME}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_USERNAME}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
pkill mysqld
/usr/bin/mysqld --user=root --datadir=/var/lib/mysql
