# Based on the PHP image for PHP 7.3 running with Apache
FROM php:8.2-apache

# Run Apache and PHP as user www-data
ENV APACHE_RUN_USER=www-data APACHE_RUN_GROUP=www-data

RUN \
# Use the default production configuration
  mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
# Install the pdo and pdo_mysql extension
  && docker-php-ext-install pdo \
# Install the gd extension
  && apt-get update \
  && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpq-dev \
  && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_pgsql pgsql

COPY development.conf /etc/apache2/sites-available/000-default.conf
RUN mkdir /srv/code
RUN chown -R www-data:www-data /srv/code
RUN a2enmod rewrite

ENTRYPOINT []
CMD sed -i "s/80/$PORT/g" /etc/apache2/sites-enabled/000-default.conf /etc/apache2/ports.conf && docker-php-entrypoint apache2-foreground
