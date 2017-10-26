FROM php:7.1-fpm

MAINTAINER Dmitry Boyko <dmitry@thebodva.com>

RUN php -r "copy('https://getcomposer.org/installer', '/tmp/composer-setup.php');"
RUN php /tmp/composer-setup.php --no-ansi --install-dir=/usr/local/bin --filename=composer && \
    rm -rf /tmp/composer-setup.php

RUN php -r "copy('https://phar.phpunit.de/phpunit.phar','/tmp/phpunit.phar');"
RUN chmod +x /tmp/phpunit.phar
RUN mv /tmp/phpunit.phar /usr/local/bin/phpunit

RUN apt-get update && \
    apt-get install -y git unzip 

RUN apt-get update && \
    apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libsqlite3-dev \
        libcurl4-gnutls-dev \
        libmagickwand-dev --no-install-recommends \
    && docker-php-ext-install -j$(nproc) iconv mcrypt gd pdo_mysql pcntl pdo_sqlite zip curl bcmath opcache mbstring soap mysqli xml\
    && pecl install imagick \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable iconv mcrypt gd pdo_mysql pcntl pdo_sqlite zip curl bcmath opcache mbstring imagick soap mysqli xml \
    && apt-get autoremove -y

RUN docker-php-ext-install exif \
    && docker-php-ext-enable exif

EXPOSE 9000

CMD ["php-fpm"]