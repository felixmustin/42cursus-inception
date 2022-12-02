FROM debian:buster

RUN	apt-get -y update \
	&& apt-get -y install nginx \
	&& apt-get install -y openssl

RUN	openssl req -x509 -nodes -days 360 -newkey rsa:2048 -keyout /etc/ssl/private_key.key -out /etc/ssl/certificate.crt -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19/CN=fmustin"

COPY conf/default /etc/nginx/sites-available/default

EXPOSE 443

CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
