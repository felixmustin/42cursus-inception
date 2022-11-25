#!/bin/sh

sed -i -e "s/{DB_USER}/$DB_USERNAME/g" wordpress/wp-config.php
sed -i -e "s/{DB_PASSWD}/$DB_PASSWORD/g" wordpress/wp-config.php
sed -i -e "s/{DB_HOSTNAME}/$DB_HOSTNAME/g" wordpress/wp-config.php
sed -i -e "s/{DB_NAME}/$DB_DATABASE/g" wordpress/wp-config.php

cp -r /wordpress/* /var/www/html/wordpress/

php-fpm7.3 -FR
