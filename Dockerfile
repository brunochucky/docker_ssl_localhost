FROM php:8.2-apache
# FROM arm64v8/php:7.2-apache

RUN a2enmod ssl && a2enmod rewrite
RUN mkdir -p /etc/apache2/ssl

# COPY ./php/php.ini /usr/local/etc/php/php.ini-development

COPY ./ssl/*.pem /etc/apache2/ssl/
COPY ./apache/000-default.conf /etc/apache2/sites-available/000-default.conf

WORKDIR /var/www/html

EXPOSE 80
EXPOSE 443