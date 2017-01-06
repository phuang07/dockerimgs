FROM ubuntu:14.04.5

# Update and install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive
# RUN apt-get upgrade


RUN apt-get -y install apache2

# Install supervisor to enable manage multiple process within a container
# reference: https://docs.docker.com/articles/using_supervisord/
RUN apt-get -y install supervisor
# RUN apt-get -y install openssh-server

RUN apt-get -y install libapache2-mod-php5
RUN apt-get -y install git-core
RUN apt-get -y install fish
RUN apt-get -y install vim
RUN apt-get -y install wget

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY apache.vhost.conf /etc/apache2/sites-enabled/000-default.conf

# Enabled some apache module
RUN a2enmod rewrite
RUN a2enmod ssl


# Fix term variable that prevent fish shell fireup properly
# http://blog.elab.io/2015/05/fish-shell-could-not-set-up-terminal.html
ENV TERM linux

# Add this to fix file permission issue when mounting data volume
# from host machine
RUN usermod -u 1000 www-data

# Create new user
# RUN adduser remoteuser
# RUN echo remoteuser:secret | chpasswd
# RUN useradd -p $(openssl passwd -1 secret) remoteuser
# RUN gpasswd -a remoteuser sudo


WORKDIR /var/www/html
VOLUME /var/www/html

EXPOSE 80 443

USER root
COPY docker-entrypoint.sh /usr/local/bin/
CMD docker-entrypoint.sh

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
