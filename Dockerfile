FROM php:7-fpm-alpine

RUN apk add --no-cache freetype-dev libpng-dev libjpeg-turbo-dev freetype libpng libjpeg-turbo \
	&& docker-php-ext-install bcmath gd mbstring mysqli pdo pdo_mysql opcache tokenizer zip \
    && docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev

#Configuring php.ini
COPY php.ini /usr/local/etc/php/conf.d/custom_php.ini

WORKDIR /var/www
