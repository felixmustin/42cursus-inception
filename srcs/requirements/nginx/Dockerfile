FROM	debian:buster

RUN 	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install openssl -y
	
RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=BE/ST=BRUSSELS/L=BRUSSELS/O=19/OU=fmustin/CN=localhost"

RUN	mkdir -p /var/run/nginx
COPY 	conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
