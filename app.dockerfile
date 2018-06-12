###FROM php:7.0.4-fpm
FROM php:7.1.3-fpm


#COPY laravel.tar.gz /root
#RUN cd /root
#RUN tar -xzvf /root/laravel.tar.gz -C /var
#RUN ls -lsa /var
#RUN ls -l /var/www
#RUN cp /var/www/.env.example /var/www/.env




RUN apt-get update && apt-get install -y libmcrypt-dev \
    mysql-client libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-install mcrypt pdo_mysql


RUN apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring
####RUN composer create-project laravel/laravel=5.5 /app
RUN rm -fR /var/www
WORKDIR /var/www
RUN git clone https://github.com/laravel/laravel.git /var/www
RUN composer install
####CMD php artisan serve --host=127.0.0.1 --port=8000
####RUN mkdir -p /var/www
####RUN cp -r /app/. /var/www
####RUN mv /var/app /var/www
####WORKDIR /var/www
RUN mkdir -p /var/www/html
##
RUN cp /var/www/.env.example /var/www/.env
RUN chown -R www-data:www-data /var/www
RUN ls -lsa /var/www
RUN php artisan key:generate
