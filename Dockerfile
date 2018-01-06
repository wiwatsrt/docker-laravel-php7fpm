FROM php:7.2-fpm-alpine3.6

RUN apk add --no-cache freetype-dev libpng-dev libjpeg-turbo-dev freetype libpng libjpeg-turbo \
    && docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install bcmath gd mbstring mysqli pdo pdo_mysql opcache tokenizer zip \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

#Configuring php.ini
COPY php.ini /usr/local/etc/php/conf.d/custom_php.ini

WORKDIR /var/www
