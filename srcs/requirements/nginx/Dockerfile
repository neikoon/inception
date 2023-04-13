FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj "/C=DE/ST=BW/L=Heilbronn/O=42Heilbronn/OU=nhaas/CN=login.42./"

COPY ./conf/global.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/server.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
