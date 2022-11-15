FROM alpine:3.16

RUN 	apt-get update && \
	apt-get install -y nginx && \
	mkdir /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
