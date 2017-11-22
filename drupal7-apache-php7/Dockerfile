# This image create an container with Drupal 7.56 with PHP 5.6
#
FROM drupal:7.56-apache

COPY 000-default.conf /etc/apache2/sites-available/
COPY default-ssl.conf /etc/apache2/sites-available/

# Enable ssl module
RUN a2enmod ssl
RUN mkdir -p /etc/apache2/ssl/certs
RUN openssl req -x509 -nodes -days 1095 -newkey rsa:2048 -subj '/CN=docker-CA' -out /etc/apache2/ssl/certs/server.crt -keyout /etc/apache2/ssl/certs/server.key
RUN service apache2 restart
RUN a2ensite default-ssl
RUN service apache2 restart
