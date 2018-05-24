FROM php:7.2-apache
ENV APACHE_DOCUMENT_ROOT /var/www/html/public
RUN a2enmod rewrite

RUN apt-get update
RUN apt-get install -y apt-transport-https wget gnupg
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -
RUN curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list > /etc/apt/sources.list.d/mssql-release.list

RUN apt-get update
RUN ACCEPT_EULA=Y apt-get install -y \
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
		msodbcsql17 \
		unixodbc-dev

RUN docker-php-ext-configure \
  gd --with-jpeg-dir=DIR --with-freetype-dir=/usr/lib64/

RUN docker-php-ext-install hash
RUN docker-php-ext-install iconv
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql

RUN pecl install pdo_sqlsrv

RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl

# initial configuration of SQL Server PHP connector
RUN echo "extension=pdo_sqlsrv.so" >> /usr/local/etc/php/conf.d/pdo_sqlsrv.ini

# install composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer