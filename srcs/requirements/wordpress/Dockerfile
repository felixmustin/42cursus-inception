FROM 	debian:buster

EXPOSE 	9000

ARG	DB_USERNAME
ARG 	DB_PASSWORD
ARG	DB_DATABASE

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php php-fpm php-cgi php7.3-mysql wget

#PHP FPM
COPY 	./conf/wp.conf /etc/php/7.3/fpm/pool.d/www/conf
RUN	mkdir -p /run/php

#WORDPRESS SETUP
RUN	mkdir -p /var/www/app
COPY 	./conf/wp-conf.php /home

RUN 	wget http:://wordpress.org/latest.tar.gz && \
 	tar -xvf latest.tar.gz && \
	rm latest.tar.gz && \
	mv -f wordpress /var/www/app && \
	chown -R www-data:www-data /var/www/app/wordpress && \
	rm /var/www/app/wordpress/wp-config-sample.php && \
	mv /home/wp-conf.php /var/www/app/wordpress/ && \

RUN sed -i "s/DATABASE_USER/$DB_USERNAME/g" /var/www/wp/wordpress/wp-config.php
RUN sed -i "s/DATABASE_NAME/$DB_DATABASE/g" /var/www/wp/wordpress/wp-config.php
RUN sed -i "s/DATABASE_PASS/$DB_PASSWORD/g" /var/www/wp/wordpress/wp-config.php

CMD	["php-fpm7.3", "-F"]
