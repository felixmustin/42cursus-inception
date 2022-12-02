FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php php-fpm php-cgi php-pdo php7.3-mysql wget curl

COPY 	./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN 	mkdir /run/php

RUN	wget https://wordpress.org/latest.tar.gz \
	&& tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN 	curl -Ok https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

RUN	mkdir -p /var/www/html 

COPY	./conf/wp-config.php /wordpress/wp-config.php

EXPOSE 	9000

COPY 	tools/run.sh /
RUN 	chmod +x ./run.sh

ENTRYPOINT 	[ "./run.sh" ]
CMD		["php-fpm7.3", "-F"]
