FROM php:7.1.3-fpm

RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql


RUN apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring

RUN mkdir /var/www/laravel
WORKDIR /var/www/laravel
RUN git clone https://github.com/laravel/laravel.git /var/www/laravel
RUN composer install


RUN mkdir -p /var/www/laravel

RUN cp /var/www/laravel/.env.example /var/www/laravel/.env
RUN chown -R www-data:www-data /var/www/laravel
RUN ls -lsa /var/www/laravel
