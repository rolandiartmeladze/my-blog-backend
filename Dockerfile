FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    git \
    nginx \
    libzip-dev \
    libxml2-dev \
    libicu-dev \
    oniguruma-dev

RUN docker-php-ext-configure intl \
    && docker-php-ext-install pdo pdo_mysql mbstring exif bcmath ctype intl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www

WORKDIR /var/www
RUN composer install --no-dev --optimize-autoloader --no-interaction --prefer-dist

COPY ./docker/nginx/laravel.conf /etc/nginx/sites-available/laravel
RUN ln -s /etc/nginx/sites-available/laravel /etc/nginx/sites-enabled/

RUN php artisan key:generate
RUN php artisan config:clear

EXPOSE 80
CMD ["php-fpm"]
