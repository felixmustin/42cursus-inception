FROM debian:buster

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx && apt-get install -y openssl

RUN	openssl req -x509 -nodes -days 360 -newkey rsa:2048 -keyout /etc/ssl/private_key.key -out /etc/ssl/certificate.crt -subj "/C=BE/ST=Bruxelles/L=Bruxelles/O=19/CN=fmustin"

# Copy the Nginx config
COPY default /etc/nginx/sites-available/default

# Expose the port for access
EXPOSE 443

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
