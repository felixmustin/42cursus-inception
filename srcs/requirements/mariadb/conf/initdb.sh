#!/bin/bash
service mysql start
if [ ! -d /var/lib/mysql/$DB_DATABASE$ ]
then
	echo "mariadb already configured"
else
	mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password;"
	mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '$DB_ROOT_PASSWORD';"
	mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE DATABASE $DB_DATABASE;"
	mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE USER '$DB_USERNAME' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -u root -p$DB_ROOT_PASSWORD -e "GRANT USAGE ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"
	mysql -u root -p$DB_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $DB_DATABASE.* TO '$DB_USERNAME'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;;"
	mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE USER 'evaluator' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -u root -p$DB_ROOT_PASSWORD -e "GRANT USAGE ON $DB_DATABASE.* TO 'evaluator'@'%' IDENTIFIED BY '$DB_PASSWORD' WITH GRANT OPTION;"

fi
