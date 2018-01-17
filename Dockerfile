FROM php:5.6-apache

# Dependencies
RUN apt-get update && apt-get install -y \
	libxml2-dev \
	libpng-dev \
	zlib1g-dev \
	libicu-dev \
	g++ \
	libbz2-dev \
	libmcrypt-dev \
	libgmp-dev \
	libmagickwand-dev \
	libmhash-dev \
	libmemcached-dev \
	libpspell-dev \
	libpcre3-dev

# PHP extensions
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install intl
RUN docker-php-ext-install simplexml
RUN docker-php-ext-install pdo
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install json
RUN docker-php-ext-install zip
RUN pecl install redis
RUN docker-php-ext-enable redis
RUN pecl install apcu-4.0.11 \
    && echo extension=apcu.so > /usr/local/etc/php/conf.d/apcu.ini
RUN docker-php-ext-install bz2
RUN docker-php-ext-install calendar
RUN docker-php-ext-install exif
RUN docker-php-ext-install gettext
RUN docker-php-ext-install mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install shmop
RUN docker-php-ext-install soap
RUN docker-php-ext-install sockets
RUN docker-php-ext-install wddx
RUN pecl install imagick \
	&& docker-php-ext-enable imagick
#RUN docker-php-ext-install gmp
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install hash
#RUN docker-php-ext-install memcached
RUN docker-php-ext-install pspell
RUN pecl install igbinary \
	&& docker-php-ext-enable igbinary
#RUN docker-php-ext-install pcre

# Apache modules
RUN a2enmod rewrite
RUN a2enmod expires
RUN a2enmod headers
RUN a2enmod deflate
