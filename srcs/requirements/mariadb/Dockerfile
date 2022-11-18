FROM	debian:buster

RUN	apt-get update && \
	apt-get upgrade -y && \
	apt-get -y install mariadb-server
	
EXPOSE 	3306

COPY	./conf/server.cnf /etc/mysql/mariadb.conf.d/

RUN	mkdir -p /run/mysqld
RUN	mkdir -p /var/lib/mysql

RUN	chown -R mysql /var/lib/mysql
RUN	chmod 777 /var/lib/mysql

COPY	./conf/init_db.sh init_db.sh
RUN	chmod +x init_db.sh

ENTRYPOINT	["./init_db.sh"]
