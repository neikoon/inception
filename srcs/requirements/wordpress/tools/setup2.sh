#!/bin/bash

# set -ex
# wait for mariadb to be finished before starting wordpress
for i in {1..45}
do
	mysqladmin -u ${DB_USER} --password=${DB_PASSWORD} \
	--host=${DB_HOST} --protocol=tcp --port=3306 status 2> /dev/null
	if [[ "$?" == 0 ]]; then
		break ;
	fi
	echo "waiting for 1s"
	sleep 1
done

# create user if wordpress is installed
if ! wp core is-installed --allow-root --path=${WP_ROOT_DIR};
	then

	echo "config create"
	wp config create --path=${WP_ROOT_DIR} --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --allow-root
	echo "core install"
	wp core install --path=${WP_ROOT_DIR} --url=${WP_URL} \
					--title=${WP_URL} \
					--admin_user=${WP_ADMIN} \
					--admin_password=${WP_ADMIN_PASS} \
					--admin_email=${WP_ADMIN_EMAIL} \
					--allow-root

	echo "user create"
	wp user create --path=${WP_ROOT_DIR} ${WP_USER} "${WP_USER_EMAIL}" --user_pass=${WP_USER_PASS} --role=author --allow-root
fi

echo "php-fpm"
php-fpm7.3 -F
