FROM php:7.3-apache
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
		unzip

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install iconv
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer