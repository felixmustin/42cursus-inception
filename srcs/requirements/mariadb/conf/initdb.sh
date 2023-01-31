#!/bin/bash

if [ -d /var/lib/mysql/$MYSQL_DATABASE ];
then
	echo "Already configured"
else

service mysql start

mysql --user=root << _EOF_
DELETE FROM mysql.user where User='';
DELETE FROM mysql.user where User='root' and Host not in ('localhost', '127.0.0.1', '::1');
SET password for 'root'@'localhost' = password('$MYSQL_ROOT_PASSWORD');
DROP DATABASE IF EXISTS $MYSQL_DATABASE;
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
_EOF_

mysqladmin --user=root --password=$MYSQL_ROOT_PASSWORD shutdown

fi

exec "$@"
