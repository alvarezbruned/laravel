FROM php:7.3-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql


RUN apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring

RUN rm -fR /var/www
WORKDIR /var/www
RUN git clone https://github.com/laravel/laravel.git /var/www
RUN composer install

RUN mkdir -p /var/www/html

RUN cp /var/www/.env.example /var/www/.env

RUN chown -R www-data:www-data /var/www
RUN ls -lsa /var/www
RUN php artisan key:generate
