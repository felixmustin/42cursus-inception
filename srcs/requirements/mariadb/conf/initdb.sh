#!/bin/bash

service mysql start
if [ -d /var/lib/mysql/$MYSQL_DATABASE ];
then
	echo "Already configured"
else
mysql -u root -e "DROP DATABASE IF EXISTS $MYSQL_DATABASE;"
mysql -u root -e "DROP USER IF EXISTS '$MYSQL_USER'@'%';"
mysql -u root -e "CREATE DATABASE $MYSQL_DATABASE;"
mysql -u root -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
mysql -u root -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"
#mysql -u root -e "alter user 'root'@'localhost' identified by '$MYSQL_ROOT_PASSWORD'";
fi

service mysql stop
exec "$@"
