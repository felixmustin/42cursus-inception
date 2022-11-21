#!/bin/sh

#mkdir -p /home/fmustin/data/database
#mkdir -p /home/fmustin/data/www

#/usr/bin/mysql_install_db --user=root --basedir=/usr --datadir=/var/lib/mysql
#/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

#mysql -e "CREATE DATABASE IF NOT EXISTS \`${DB_DATABASE}\`;"
#mysql -e "CREATE USER IF NOT EXISTS \`${DB_USERNAME}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
#mysql -e "GRANT ALL PRIVILEGES ON \`${DB_DATABASE}\`.* TO \`${DB_USERNAME}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';"
#mysql -e "FLUSH PRIVILEGES;"
#pkill mysqld
#/usr/bin/mysqld --user=root --datadir=/var/lib/mysql

if [ ! -d /var/lib/mysql/${DB_DATABASE} ]; then
    mysqld&
    until mysqladmin ping; do
        sleep 2
    done
    cd /root/
    mysql -e "CREATE DATABASE ${DB_DATABASE};"
    mysql -e "CREATE USER '${DB_ROOT_USERNAME}'@'%' IDENTIFIED BY '${DB_ROOT__PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT_USERNAME}'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "CREATE USER '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USERNAME}'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
    mysql -e "DELETE FROM mysql.user WHERE user=''"
    mysql -e "DELETE FROM mysql.user WHERE user='root'"
    mysql -e "FLUSH PRIVILEGES;"
    killall mysqld
fi
exec "$@"
