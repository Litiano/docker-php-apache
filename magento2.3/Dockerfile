FROM php:7.3-apache
RUN a2enmod rewrite

LABEL maintainer="litiano.moura@yahoo.com.br"
LABEL php_version="7.3"
LABEL magento_version="2.3"
LABEL description="Magento 2.3 with PHP 7.3"

ENV MAGENTO_VERSION 2.3.5-p1

RUN apt update
RUN apt install -y \
		libmcrypt-dev \
		libxml2-dev \
		zlib1g-dev \
		libicu-dev \
		g++ \
		sendmail \
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
		unzip \
		wget \
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

RUN echo "memory_limit=4G" > /usr/local/etc/php/conf.d/memory-limit.ini

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer

RUN cd /var/www && \
    rm -rf html && \
    wget https://github.com/magento/magento2/archive/$MAGENTO_VERSION.zip && \
    unzip $MAGENTO_VERSION.zip && \
    mv magento2-$MAGENTO_VERSION html && \
    rm -rf $MAGENTO_VERSION.zip && \
    cd html && \
    find var generated vendor pub/static pub/media app/etc -type f -exec chmod g+w {} + && \
    find var generated vendor pub/static pub/media app/etc -type d -exec chmod g+ws {} + && \
    chown -R :www-data . && \
    chmod u+x bin/magento

RUN pecl install xdebug \
    && echo "zend_extension=xdebug.so" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_host=host.docker.internal" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=0" >> /usr/local/etc/php/conf.d/xdebug.ini

RUN cd /tmp \
    && wget https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.zip \
    && unzip ioncube_loaders_lin_x86-64.zip \
    && mv ioncube/ioncube_loader_lin_7.3.so /usr/local/lib/php/extensions/ioncube_loader_lin_7.3.so \
    && echo "zend_extension=/usr/local/lib/php/extensions/ioncube_loader_lin_7.3.so" > /usr/local/etc/php/conf.d/00-ioncube.ini \
    && rm -rf ioncube_loaders_lin_x86-64.zip ioncube

RUN cd /var/www/html \
    && composer require rafaelstz/traducao_magento2_pt_br:dev-master \
    imaginationmedia/correios


