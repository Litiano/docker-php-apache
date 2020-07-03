FROM php:7.2-fpm

LABEL maintainer="litiano.moura@yahoo.com.br"
LABEL php_version="7.2"
LABEL description="PHP 7.2 FPM"

RUN apt update
RUN apt install -y \
		libmcrypt-dev \
		libxml2-dev \
		zlib1g-dev \
		libicu-dev \
		g++ \
		libpng-dev \
		libxml2-dev \
		libxslt-dev \
		libjpeg62-turbo-dev \
		libfreetype6-dev \
		libzip-dev \
		libpng++-dev \
		libcurl3-dev \
		libfreetype6 \
		libfreetype6-dev \
		libicu-dev \
		libxslt1-dev \
		nano \
		wget \
		unzip \
		git

RUN docker-php-ext-install iconv
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install zip
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl
RUN docker-php-ext-install sockets
RUN docker-php-ext-install opcache
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=DIR
RUN docker-php-ext-install gd

RUN echo "memory_limit=4G" > $PHP_INI_DIR/conf.d/memory-limit.ini

RUN mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini"

RUN cd /tmp \
    && wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip \
    && unzip ioncube_loaders_lin_x86-64.zip \
    && mv ioncube/ioncube_loader_lin_7.2.so /usr/local/lib/php/extensions/ioncube_loader_lin_7.2.so \
    && echo ";zend_extension=/usr/local/lib/php/extensions/ioncube_loader_lin_7.2.so" > $PHP_INI_DIR/conf.d/00-ioncube.ini \
    && rm -rf ioncube_loaders_lin_x86-64.zip ioncube

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

COPY www.conf /usr/local/etc/php-fpm.d/www.conf