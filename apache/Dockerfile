FROM ubuntu:14.04

# Update and install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive 
# RUN apt-get upgrade

RUN apt-get -y install curl
RUN apt-get -y install apache2

# Install supervisor to enable manage multiple process within a container
# reference: https://docs.docker.com/articles/using_supervisord/
RUN apt-get -y install supervisor
RUN apt-get -y install openssh-server

RUN apt-get -y install php5
RUN apt-get -y install php5-cli
RUN apt-get -y install php5-mcrypt
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

# Grab composer and install it in /usr/local/bin/composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor

COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY ./config/apache.vhost.conf /etc/apache2/sites-enabled/000-default.conf

# Enabled some apache module
RUN php5enmod mcrypt
RUN a2enmod rewrite
RUN a2enmod ssl

# Configure xdebug
ENV XDEBUG_PORT 9000
ADD ./config/config_xdebug.sh /config_xdebug.sh
RUN chmod +x /config_xdebug.sh


# Add this to fix file permission issue when mounting data volume
# from host machine
RUN usermod -u 1000 www-data

# Create new user
# RUN adduser remoteuser
# RUN echo remoteuser:secret | chpasswd 
RUN useradd -p $(openssl passwd -1 secret) remoteuser
RUN gpasswd -a remoteuser sudo


EXPOSE 80 443 22 9000
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

