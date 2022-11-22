#!/bin/sh

mysql_install_db
/etc/init.d/mysql start

if [ -d "/var/lib/mysql/$DB_DATABASE" ]
then
	echo "Databse already configured"
else
	echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$DB_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
	echo "CREATE DATABASE IF NOT EXISTS $DB_DATABASE; GRANT ALL ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot
mysql -uroot -p$DB_ROOT_PASSWORD $DB_DATABASE < /usr/local/bin/wordpress.sql

fi
/etc/init.d/mysql stop
exec "$@"


#if [ ! -d /var/lib/mysql/${DB_DATABASE} ]; then
#    mysqld&
#    until mysqladmin ping; do
#        sleep 2
#    done
#    cd /root/
#    mysql -e "CREATE DATABASE ${DB_DATABASE};"
#    mysql -e "CREATE USER '${DB_ROOT_USERNAME}'@'%' IDENTIFIED BY '${DB_ROOT__PASSWORD}';"
#    mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_ROOT_USERNAME}'@'%';"
#    mysql -e "FLUSH PRIVILEGES;"
#    mysql -e "CREATE USER '${DB_USERNAME}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
#    mysql -e "GRANT ALL PRIVILEGES ON ${DB_DATABASE}.* TO '${DB_USERNAME}'@'%';"
#    mysql -e "FLUSH PRIVILEGES;"
#    mysql -e "DELETE FROM mysql.user WHERE user=''"
#    mysql -e "DELETE FROM mysql.user WHERE user='root'"
#    mysql -e "FLUSH PRIVILEGES;"
#    killall mysqld
#fi

#exec "$@"
