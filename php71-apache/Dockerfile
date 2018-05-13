FROM php:7.1-apache
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
		libfreetype6-dev

RUN docker-php-ext-configure \
  gd --with-jpeg-dir=DIR --with-freetype-dir=/usr/lib64/

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
RUN docker-php-ext-install gd
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl

#EXPOSE 80:8080

#Como executar
#docker run -d -v C:\Users\H4\PhpstormProjects\Ancolie-2018\:/var/www/html --net="host" php70-apache
#verificar ip da maquina real com ip addr e conectar no mysql