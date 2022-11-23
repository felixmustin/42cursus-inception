FROM 	debian:buster

EXPOSE 	9000

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php php-fpm php-cgi php-pdo php7.3-mysql wget

#PHP FPM
RUN	mkdir -p /var/www/html
COPY 	./conf/www.conf /var/www/html
RUN	mkdir /run/php

COPY 	./conf/init_wp.sh /usr/local/bin
RUN 	chmod +x /usr/local/bin/init_wp.sh

ENTRYPOINT ["/usr/local/bin/init_wp.sh"]

WORKDIR /var/www/html/

CMD ["/usr/sbin/php-fpm7.3", "-F"]





#WORDPRESS SETUP
#RUN	mkdir -p /var/www/app
#COPY 	./conf/wp-conf.php /home

#RUN 	wget wordpress.org/latest.tar.gz
#RUN 	tar -xzvf latest.tar.gz
#RUN	rm latest.tar.gz
#RUN	mv -f wordpress /var/www/app
#RUN	chown -R www-data:www-data /var/www/app/wordpress
#RUN	rm /var/www/app/wordpress/wp-config-sample.php
#RUN	mv /home/wp-conf.php /var/www/app/wordpress/

#RUN sed -i "s/DATABASE_USER/$DB_USERNAME/g" /var/www/app/wordpress/wp-conf.php
#RUN sed -i "s/DATABASE_NAME/$DB_DATABASE/g" /var/www/app/wordpress/wp-conf.php
#RUN sed -i "s/DATABASE_PASS/$DB_PASSWORD/g" /var/www/app/wordpress/wp-conf.php

#CMD	["php-fpm7.3", "-F"]
