FROM php:7.1.3-fpm

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

COPY run_tests.sh /var/www
RUN chmod +x /var/www/run_tests.sh

#ADD crontab /etc/cron.d/run_tests
#RUN chmod 0644 /etc/cron.d/run_tests


RUN chown -R www-data:www-data /var/www
RUN ls -lsa /var/www
RUN php artisan key:generate

#CMD cron
CMD /var/www/run_tests.sh
