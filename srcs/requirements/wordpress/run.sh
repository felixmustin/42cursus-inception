#!/bin/sh

sed -i -e "s/{DB_USER}/$MYSQL_USER/g" wordpress/wp-config.php
sed -i -e "s/{DB_PASSWD}/$MYSQL_PASSWORD/g" wordpress/wp-config.php
sed -i -e "s/{DB_HOSTNAME}/$DB_HOSTNAME/g" wordpress/wp-config.php
sed -i -e "s/{DB_NAME}/$MYSQL_DATABASE/g" wordpress/wp-config.php

cp -r /wordpress/* /var/www/html/wordpress/

wp --allow-root --path=/var/www/html/wordpress core install \
	--url=fmustin.42.fr \
	--title="Example" \
	--admin_name=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL

php-fpm7.3 -FR
