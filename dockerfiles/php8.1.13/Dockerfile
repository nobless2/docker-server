FROM php:8.1.13-fpm-alpine

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apk add git openssh-client

RUN docker-php-ext-install pdo pdo_mysql