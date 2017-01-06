# We using 12.04 because it comes with PHP 5.3.10-1ubuntu3.22
FROM ubuntu:14.04.5

# Update and install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive
RUN apt-get -y install apt-utils
# RUN apt-get upgrade

# Install PHP with packages
RUN apt-get -y install php5
RUN apt-get -y install php5-common
RUN apt-get -y install php5-cli
RUN apt-get -y install php5-fpm

# RUN apt-get -y install php5-opcache
# RUN apt-get -y install php5-dom
# RUN apt-get -y install php5-xml
# RUN apt-get -y install php5-xmlreader
# RUN apt-get -y install php5-ctype
# RUN apt-get -y install php5-ftp
RUN apt-get -y install php5-gd
RUN apt-get -y install php5-json
RUN apt-get -y install php5-curl
# RUN apt-get -y install php5-pdo
# RUN apt-get -y install php5-pdo_mysql
# RUN apt-get -y install php5-sockets
# RUN apt-get -y install php5-zlib
RUN apt-get -y install php5-mcrypt
# RUN apt-get -y install php5-pcntl
# RUN apt-get -y install php5-sqlite3
# RUN apt-get -y install php5-bz2
# RUN apt-get -y install php5-pear
# RUN apt-get -y install php5-exif
# RUN apt-get -y install php5-phar
# RUN apt-get -y install php5-openssl
# RUN apt-get -y install php5-zip
# RUN apt-get -y install php5-calendar
# RUN apt-get -y install php5-iconv
# RUN apt-get -y install php5-imap
# RUN apt-get -y install php5-soap
RUN apt-get -y install php5-memcache
RUN apt-get -y install php5-redis
RUN apt-get -y install php5-xdebug
RUN apt-get -y install php5-xsl
RUN apt-get -y install php5-ldap
# RUN apt-get -y install php5-bcmath
RUN apt-get -y install php5-apcu

# Other util
RUN apt-get -y install libapache2-mod-php5
RUN apt-get -y install curl
RUN apt-get -y install git-core
RUN apt-get -y install fish
RUN apt-get -y install vim
RUN apt-get -y install wget


# Grab composer and install it in /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer


# Install PHPUnit
RUN curl -sSL https://phar.phpunit.de/phpunit.phar -o phpunit.phar
RUN chmod +x phpunit.phar
RUN mv phpunit.phar /usr/local/bin/phpunit

# Configure php.ini
RUN sed -i \
        -e "s/^expose_php.*/expose_php = Off/" \
        -e "s/^;date.timezone.*/date.timezone = UTC/" \
        -e "s/^memory_limit.*/memory_limit = -1/" \
        -e "s/^max_execution_time.*/max_execution_time = 300/" \
        -e "s/^; max_input_vars.*/max_input_vars = 2000/" \
        -e "s/^post_max_size.*/post_max_size = 512M/" \
        -e "s/^upload_max_filesize.*/upload_max_filesize = 512M/" \
        -e "s/^;always_populate_raw_post_data.*/always_populate_raw_post_data = -1/" \
        -e "s/^error_reporting.*/error_reporting = E_ALL/" \
        -e "s/^display_errors.*/display_errors = On/" \
        -e "s/^display_startup_errors.*/display_startup_errors = On/" \
        -e "s/^track_errors.*/track_errors = On/" \
        -e "s/^mysqlnd.collect_memory_statistics.*/mysqlnd.collect_memory_statistics = On/" \
        /etc/php5/apache2/php.ini && \

    echo "error_log = \"/proc/self/fd/2\"" | tee -a /etc/php5/apache2/php.ini


# Install drush
RUN php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > /usr/local/bin/drush
RUN chmod +x /usr/local/bin/drush


# Copy PHP configs
COPY opcache.ini /etc/php5/conf.d/
COPY xdebug.ini /etc/php5/conf.d/
COPY php-fpm.conf /etc/php5/

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

USER root
COPY docker-entrypoint.sh /usr/local/bin/
CMD docker-entrypoint.sh


EXPOSE 9000
# CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
