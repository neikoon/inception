#!/bin/bash

#if ![ -d /var/www/wordpress/wp-config.php]; then

	mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
	sed -i "s/database_name_here/${DB_NAME}/g" /var/www/wordpress/wp-config.php
	sed -i "s/username_here/${DB_USER}/g" /var/www/wordpress/wp-config.php
	sed -i "s/password_here/${DB_PASSWORD}/g" /var/www/wordpress/wp-config.php
	sed -i "s/localhost/${DB_HOST}/g" /var/www/wordpress/wp-config.php
#fi

#if ! wp core is-installed --allow-root --path=/var/www/wordpress; then

	wp core install --path=/var/www/wordpress --url=${WP_URL} --title=${WP_URL} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASS} --admin_email=${WP_ADMIN_EMAIL} --allow-root
	wp user create --path=/var/www/wordpress ${WP_USER} "${WP_USER_EMAIL}" --user_pass=${WP_USER_PASS} --role=author --allow-root
#fi

php-fpm7.3 -F
