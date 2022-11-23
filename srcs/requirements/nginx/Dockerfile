FROM	debian:buster

RUN 	apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y nginx && \
	apt-get install openssl -y
	
#RUN	mkdir -p /etc/nginx/ssl
RUN	openssl req -x509 -nodes -days 360 -newkey rsa:2048 -keyout /etc/ssl/private_key.key -out /etc/ssl/certificate.crt -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19/CN=fmustin"


#RUN	mkdir -p /var/run/nginx
COPY 	conf/nginx.conf /etc/nginx/conf.d

#RUN	chmod 755 /var/www/html && \
#	chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
