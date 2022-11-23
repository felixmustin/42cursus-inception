#FROM	debian:buster

#RUN	apt-get update && \
#	apt-get upgrade -y && \
#	apt-get -y install mariadb-server mariadb-client
	
#EXPOSE 	3306

#COPY	./conf/server.cnf /etc/mysql/mariadb.conf.d/

#RUN	mkdir -p /var/run/mysqld
 #RUN	mkdir -p /var/lib/mysql

#RUN	chown -R mysql:mysql /var/run/mysqld
 #RUN	chown -R mysql:root /run/mysqld
#RUN	chmod 777 /var/run/mysqld

#COPY	./conf/init_db.sh /usr/local/bin/
#RUN	chmod +x /usr/local/bin/init_db.sh

#COPY	./conf/wordpress.sql /usr/local/bin/

#ENTRYPOINT	["/usr/local/bin/init_db.sh"]

#CMD ["mysqld", "--bind-address=0.0.0.0"]



FROM debian:buster

ARG DB_ROOT_PASSWORD
ARG DB_USERNAME
ARG DB_PASSWORD
ARG DB_DATABASE

RUN apt-get update && \
	apt-get install mariadb-server -y
#chmod -R 777 /var/lib/mysql && \


RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

#COPY conf/my.cnf /etc/mysql/
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/init_db.sh /
RUN chmod +x /init_db.sh
RUN ./init_db.sh

ENTRYPOINT [ "mysqld" ]
