# We using 12.04 because it comes with PHP 5.3.10-1ubuntu3.22
# Based on: https://github.com/wodby/drupal-php/tree/master/5.6
FROM ubuntu:12.04

# Update and install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive
# RUN apt-get upgrade

RUN apt-get -y install curl

# Install supervisor to enable manage multiple process within a container
# reference: https://docs.docker.com/articles/using_supervisord/
# RUN apt-get -y install supervisor
# RUN apt-get -y install openssh-server

RUN apt-get -y install php5
RUN apt-get -y install php5-cli
RUN apt-get -y install php5-mcrypt
RUN apt-get -y install php5-fpm
RUN apt-get -y install php5-opcache
RUN apt-get -y install php5-gd
RUN apt-get -y install php5-json
RUN apt-get -y install php5-mysql
RUN apt-get -y install php5-memcached
RUN apt-get -y install php5-xdebug
RUN apt-get -y install php5-curl
RUN apt-get -y install php5-ldap

RUN apt-get -y install libapache2-mod-php5
RUN apt-get -y install git-core
RUN apt-get -y install fish
RUN apt-get -y install vim
RUN apt-get -y install wget

# RUN apt-get -y install mysql-client

# Grab composer and install it in /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer


# Install PHPUnit
curl -sSL https://phar.phpunit.de/phpunit.phar -o phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit && \


# Disable Xdebug
rm /etc/php5/conf.d/xdebug.ini && \

# Configure php.ini
RUN sed -i \
        -e "s/^expose_php.*/expose_php = Off/" \
        -e "s/^;date.timezone.*/date.timezone = UTC/" \
        -e "s/^memory_limit.*/memory_limit = -1/" \
        -e "s/^max_execution_time.*/max_execution_time = 300/" \
        -e "s/^; max_input_vars.*/max_input_vars = 2000/" \
        -e "s/^post_max_size.*/post_max_size = 512M/" \
        -e "s/^upload_max_filesize.*/upload_max_filesize = 512M/" \
        -e "s/^error_reporting.*/error_reporting = E_ALL/" \
        -e "s/^display_errors.*/display_errors = On/" \
        -e "s/^display_startup_errors.*/display_startup_errors = On/" \
        -e "s/^track_errors.*/track_errors = On/" \
        -e "s/^mysqlnd.collect  _memory_statistics.*/mysqlnd.collect_memory_statistics = On/" \
        /etc/php5/php.ini && \

    #echo "error_log = \"/proc/self/fd/2\"" | tee -a /etc/php5/php.ini


# Install drush
php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > /usr/local/bin/drush && \
chmod +x /usr/local/bin/drush && \


# Copy PHP configs
COPY 00_opcache.ini /etc/php5/conf.d/
COPY 00_xdebug.ini /etc/php5/conf.d/
COPY php-fpm.conf /etc/php5/


# Add default drush aliases
RUN mkdir -p /etc/drush/site-aliases
COPY default.aliases.drushrc.php /etc/drush/site-aliases/


# Fix term variable that prevent fish shell fireup properly
# http://blog.elab.io/2015/05/fish-shell-could-not-set-up-terminal.html
ENV TERM linux

# Add this to fix file permission issue when mounting data volume
# from host machine
RUN usermod -u 1000 www-data


# Create work dir
RUN mkdir -p /var/www/html && \
    chown -R www-data:www-data /var/www

WORKDIR /var/www/html
VOLUME /var/www/html

EXPOSE 80 443 22 9000
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

USER root
COPY docker-entrypoint.sh /usr/local/bin/
CMD docker-entrypoint.sh
