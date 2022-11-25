FROM debian:buster

RUN	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y php php-fpm php-cgi php-pdo php7.3-mysql wget

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN	mkdir -p /var/www/html 

ARG	DB_USERNAME
ARG	DB_PASSWORD
ARG	DB_HOSTNAME
ARG	DB_DATABASE

COPY	./conf/wp-config.php /wordpress/wp-config.php

EXPOSE 9000

COPY run.sh /
RUN chmod +x ./run.sh

ENTRYPOINT [ "./run.sh" ]
#CMD	["php-fpm7.4", "-F"]
