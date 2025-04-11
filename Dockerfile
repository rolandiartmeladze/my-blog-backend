# პირველი ნაბიჯი: გამოიყენეთ ბაზის იმიჯი
FROM php:8.0-fpm

# მეორე ნაბიჯი: საჭირო პაკეტების ინსტალაცია
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev zip git nginx

# მესამე ნაბიჯი: Composer-ის ინსტალაცია
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# მეოთხე ნაბიჯი: პროექტის ფაილების კოპირება კონტეინერში
COPY . /var/www

# სამუშაო დირექტორია
WORKDIR /var/www

# Composer-ის დაყენება
RUN composer install --no-dev --optimize-autoloader

# Laravel-ის კონფიგურაციის გაწმენდა
RUN php artisan config:clear

# პორტის გახსნა
EXPOSE 8000

# Laravel სერვერის გაშვება
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
