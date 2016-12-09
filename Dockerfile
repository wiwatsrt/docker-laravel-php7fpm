FROM alpine:edge

RUN apk --update add php7 \
	php7-ctype \
	php7-curl \
	php7-dom \
	php7-fpm \
	php7-gd \
	php7-iconv \
	php7-json \
	php7-mbstring \
	php7-mcrypt \
	php7-mysqli \
	php7-opcache \
	php7-openssl \
	php7-pdo \
	php7-pdo_mysql \
	php7-phar \
	php7-session \
	php7-xml --repository http://nl.alpinelinux.org/alpine/edge/testing/ && rm /var/cache/apk/*

COPY php.ini /etc/php7/conf.d/custom_php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

RUN ln -s /usr/bin/php7 /usr/bin/php

RUN mkdir -p /var/www

WORKDIR /var/www

VOLUME /var/www

EXPOSE 9000

CMD ["php-fpm7", "-F"]
