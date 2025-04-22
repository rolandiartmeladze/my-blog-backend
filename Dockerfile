# Dockerfile
FROM php:8.1-fpm

# სისტემური პაკეტები
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev \
    zip git unzip curl libzip-dev \
    libxml2-dev libicu-dev \
    && apt-get clean

# PHP Extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd zip pdo pdo_mysql mbstring intl

# Composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

WORKDIR /var/www

COPY . .

RUN composer install --no-interaction --prefer-dist \
    && cp .env.example .env \
    && php artisan key:generate

EXPOSE 9000

CMD ["php-fpm"]
