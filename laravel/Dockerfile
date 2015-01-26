# Dockerfile for rastermedia/laravel-docker based on Homestead nginx + php-fpm
FROM ubuntu:14.04

# Update and install dependencies
RUN apt-get update
RUN apt-get install -y vim curl
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install php5 php5-cli php5-mcrypt php5-gd php5-json php5-mysql php5-memcached libapache2-mod-php5 php5-curl php5-ldap
RUN apt-get install -y git-core
RUN apt-get install -y apache2

# Install mysql client and server
RUN apt-get -y install mysql-client mysql-server 
# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf
# Install database
ADD ./config/database.sql /database.sql
# Set Standard settings
ENV user student
ENV password secret
ENV url file:/database.sql
ENV right READ

# Install starting script
ADD ./config/start-database.sh /start-database.sh
RUN chmod +x /start-database.sh


VOLUME /var/www/laravel
# RUN touch /var/www/laravel/index.php

# ADD ./code /var/www/
# RUN rm /etc/apache2/sites-*/*
RUN php5enmod mcrypt
RUN a2enmod rewrite
RUN a2enmod ssl
ADD ./config/apache.vhost.conf /etc/apache2/sites-available/laravel.conf

RUN a2ensite laravel


# Grab composer and install it in /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

ADD ./config/start.sh /start.sh

VOLUME /var/log

# test creat a new volume
# VOLUME /var/www/testvolume

WORKDIR /var/www

RUN chmod +x /start.sh
EXPOSE 80 443 3306
CMD ["/start.sh"]


