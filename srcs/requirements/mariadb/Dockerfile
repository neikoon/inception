
FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install mariadb-server -y
RUN apt-get install dumb-init -y

COPY ./tools/setup-mariadb.sh /usr/bin/setup-mariadb.sh
RUN chmod +x /usr/bin/setup-mariadb.sh
COPY ./conf/inception.cnf /etc/mysql/mariadb.conf.d/inception.cnf

EXPOSE 3306

ENTRYPOINT /usr/bin/dumb-init -- setup-mariadb.sh mysqld_safe
