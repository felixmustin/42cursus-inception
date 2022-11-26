FROM debian:buster

RUN apt-get update \
	&& apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY conf/initdb.sh /usr/local/bin

RUN chmod +x /usr/local/bin/initdb.sh

#RUN /usr/local/bin/initdb.sh
ENTRYPOINT [ "/usr/local/bin/initdb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
