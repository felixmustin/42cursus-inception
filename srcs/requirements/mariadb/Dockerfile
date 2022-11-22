FROM	debian:buster

RUN	apt-get update && \
	apt-get upgrade -y && \
	apt-get -y install mariadb-server mariadb-client
	
EXPOSE 	3306

COPY	./conf/server.cnf /etc/mysql/mariadb.conf.d/

RUN	mkdir -p /var/run/mysqld
#RUN	mkdir -p /var/lib/mysql

RUN	chown -R mysql:mysql /var/run/mysqld
#RUN	chown -R mysql:root /run/mysqld
RUN	chmod 777 /var/run/mysqld

COPY	./conf/init_db.sh .
RUN	chmod +x init_db.sh

#COPY	./conf/init_db.sh /usr/local/bin/
COPY	./conf/wordpress.sql /usr/local/bin/

ENTRYPOINT	["./init_db.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]
