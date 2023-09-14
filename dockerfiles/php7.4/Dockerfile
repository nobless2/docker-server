FROM php:7.4-fpm-alpine

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apk add git openssh-client

RUN docker-php-ext-install pdo pdo_mysql mysqli && docker-php-ext-enable mysqli