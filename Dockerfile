FROM php:7
RUN apt-get update -y && apt-get install -y openssl zip unzip git
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo mbstring
WORKDIR /app

RUN composer create-project laravel/laravel=5.5 /app

##RUN git clone https://github.com/buddy-works/laravel-first-steps.git /app
##COPY . /app

RUN composer install

CMD php artisan serve --host=127.0.0.1 --port=8000

EXPOSE 8000

