FROM php:5.6-apache

WORKDIR /var/www/html

RUN mkdir /home/apps

ENV APACHE_RUN_DIR /var/www/html
ENV APACHE_LOCK_DIR /var/log
ENV APACHE_LOG_DIR /var/lock
ENV APACHE_DOCUMENT_ROOT /var/www/html
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2/apache2.pid

RUN echo "ServerName localhost" > /etc/apache2/conf-available/servername.conf

RUN ln -s /etc/apache2/conf-available/servername.conf /etc/apache2/conf-enabled

RUN a2enmod rewrite

EXPOSE 80

RUN usermod -u 1000 www-data
RUN groupmod -g 1000 www-data

RUN chmod -R 0755 /var/www/html
RUN chown -R www-data:www-data /home
