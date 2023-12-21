FROM php:7.4-apache
WORKDIR /var/www/html
RUN apt-get update \
    && apt-get install -y unzip libonig-dev \
    && docker-php-ext-install mbstring \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY composer.json composer.lock ./
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer install --prefer-dist --no-scripts --no-dev --no-autoloader
COPY . .
RUN echo "DirectoryIndex src/Hello.php" >> /etc/apache2/apache2.conf
RUN composer dump-autoload --optimize --no-dev --classmap-authoritative
EXPOSE 80
CMD ["apache2-foreground"]