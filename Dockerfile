FROM php:7.2-fpm-alpine

RUN apk add --no-cache freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev libzip-dev freetype libpng libjpeg-turbo tzdata \
	&& docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-png-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-configure zip --with-libzip \
	&& docker-php-ext-install bcmath gd mbstring mysqli pcntl pdo pdo_mysql opcache tokenizer xml zip \
	&& apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev \
	&& rm -rf /var/cache/apk/*

RUN chown -R www-data:www-data /var/www

# Use the default production configuration
RUN mv $PHP_INI_DIR/php.ini-production $PHP_INI_DIR/php.ini

# Override with custom settings
COPY php.ini $PHP_INI_DIR/conf.d/custom_php.ini

WORKDIR /var/www
