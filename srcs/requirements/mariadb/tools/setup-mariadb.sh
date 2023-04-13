#!/bin/bash

if [ ! -d "/var/lib/mysql/${DB_NAME}" ]; then 

service mysql start 

mysql -e "CREATE DATABASE ${DB_NAME};"
mysql -e "CREATE USER '${DB_USER}'@'%' identified by '${DB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

service mysql stop 

fi

exec $@
