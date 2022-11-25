FROM debian:buster

RUN apt-get update \
	&& apt-get install mariadb-server -y

RUN mkdir -p /var/run/mysqld \
	&& chown -R mysql:mysql /var/run/mysqld \
	&& chmod 777 /var/run/mysqld

EXPOSE 3306

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY conf/initdb.sh /


#RUN sed -i "s/{DB_DATABASE}/$DB_DATABASE/g" initdb.sh
#RUN sed -i "s/{DB_ROOT_PASSWORD}/$DB_ROOT_PASSWORD/g" initdb.sh
#RUN sed -i "s/{DB_USERNAME}/$DB_USERNAME/g" initdb.sh
#RUN sed -i "s/{DB_PASSWORD}/$DB_PASSWORD/g" initdb.sh

COPY conf/initdb.sh /usr/local/bin

RUN chmod +x /usr/local/bin/initdb.sh
#RUN ./initdb.sh

RUN /usr/local/bin/initdb.sh
#ENTRYPOINT [ "/usr/local/bin/initdb.sh" ]

CMD ["mysqld", "--bind-address=0.0.0.0"]
