FROM ubuntu:16.04
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y \
      nginx \
      curl \
      php7.0-cli \
      php7.0-curl \
      php7.0-common \
      php7.0-fpm \      
      php-apcu \
      php7.0-mysqli \
      php-xdebug \
      php7.0-gd \
      php7.0-json \
      php7.0-ldap \
      php7.0-mbstring \
      php7.0-mysql \
      php7.0-sqlite3 \
      php7.0-xml \
      php7.0-xsl \
      php7.0-zip

COPY . /var/www/html/
RUN rm /etc/nginx/nginx.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY wordpress.conf /etc/nginx/conf.d/wordpress.conf
CMD service php7.0-fpm start && nginx -g "daemon off;"
