FROM debian:buster

RUN apt-get update && apt-get upgrade
RUN apt-get install -y curl php php-mysql mariadb-client php-fpm

RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress
RUN chown www-data:www-data /var/www/wordpress

RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN curl https://wordpress.org/latest.tar.gz --output latest.tar.gz
RUN tar -xzvf latest.tar.gz -C /var/www
RUN rm -rf latest.tar.gz

RUN mkdir -p /run/php/

COPY ./tools/setup-wordpress.sh /usr/local/bin/setup-wordpress.sh
RUN chmod +x /usr/local/bin/setup-wordpress.sh
COPY ./conf/default.conf /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT bash setup-wordpress.sh
