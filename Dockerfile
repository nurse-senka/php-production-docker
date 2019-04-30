FROM php:7.3.4-fpm-alpine

RUN set -x && \
  apk update && \
  apk add --no-cache libxml2 libxml2-dev curl curl-dev autoconf $PHPIZE_DEPS && \
  docker-php-ext-install opcache mysqli pdo pdo_mysql xml mbstring curl session tokenizer json && \
  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
  composer global require hirak/prestissimo

COPY ./config/php.ini /usr/local/etc/php/php.ini
COPY ./config/docker-php-ext-opcache.ini /usr/local/etc/php/conf.d/docker-php-ext-opcache.ini
