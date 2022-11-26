#!/bin/sh

sed -i -e "s/{DB_USER}/$MYSQL_USER/g" wordpress/wp-config.php
sed -i -e "s/{DB_PASSWD}/$MYSQL_PASSWORD/g" wordpress/wp-config.php
sed -i -e "s/{DB_HOSTNAME}/$DB_HOSTNAME/g" wordpress/wp-config.php
sed -i -e "s/{DB_NAME}/$MYSQL_DATABASE/g" wordpress/wp-config.php

cp -r /wordpress/* /var/www/html/wordpress/

php-fpm7.3 -FR
