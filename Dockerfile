FROM debian:bookworm

WORKDIR /app

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
    && apt-get clean

EXPOSE 80

CMD php artisan migrate --force && php artisan serve --host=0.0.0.0 --port=3000
