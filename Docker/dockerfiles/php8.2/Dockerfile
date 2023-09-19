FROM php:8.2-fpm-alpine

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

RUN apk add git openssh-client

# Install required packages
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    build-base \
    libpng-dev \
    libzip-dev \
    unzip \
    linux-headers \
    zip \
    linux-headers \
    && pecl install redis \
    && docker-php-ext-enable redis

RUN docker-php-ext-install  \
    pdo  \
    pdo_mysql \
    zip

#RUN pecl install xdebug
#RUN docker-php-ext-enable xdebug

RUN apk del -f .build-deps