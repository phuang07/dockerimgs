FROM phusion/baseimage

# Update and install dependencies
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install vim mysql-client mysql-server curl

# Enable remote access (default is localhost only, we change this
# otherwise our database would not be reachable from outside the container)
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./config/database.sql /database.sql
ADD ./config/start-database.sh /start-database.sh


ENV user docker
ENV password secret
ENV right WRITE
ENV url file:/database.sql


# Install starting script

RUN chmod +x /start-database.sh

EXPOSE 3306
CMD ["/start-database.sh"]
