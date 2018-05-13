FROM php:7.0-apache
RUN a2enmod rewrite

RUN apt-get update
RUN apt-get install -y \
        libmcrypt-dev \
		libxml2-dev \
		zlib1g-dev \
		libicu-dev \
		g++ \
		sendmail \
		libpng-dev \
		nano \
        libpng12-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev

RUN docker-php-ext-install hash
RUN docker-php-ext-install iconv
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-install soap