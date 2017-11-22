# We using a minimal Ubuntu base image from https://github.com/phusion/baseimage-docker
# because the stock ubuntu image doesn't work with docker very well. 

# docker build -t tomcat-solr
FROM phusion/baseimage

# Run update and get 'sudo' back
# https://github.com/tianon/docker-brew-ubuntu-core/issues/48
RUN apt-get update && apt-get install -y sudo

# Install Java7
RUN sudo su - 
RUN add-apt-repository ppa:openjdk-r/ppa 
RUN apt-get update
RUN apt-get install -y default-jdk

# Create a new user
RUN useradd -Mb /usr/local tomcat

# Install J2EE container
RUN cd /usr/local/src
RUN curl -O http://apache.osuosl.org/tomcat/tomcat-9/v9.0.1/bin/apache-tomcat-9.0.1.tar.gz
RUN tar -xzf apache-tomcat-9.0.1.tar.gz
RUN mv apache-tomcat-9.0.1 /usr/local/tomcat

#replace port 8080 -> 8983
RUN sed -i s/8080/8983/g /usr/local/tomcat/conf/server.xml

# start tomcat server and run as the user 'tomcat'
RUN chown -R tomcat:tomcat /usr/local/tomcat
# RUN sudo -u tomcat /usr/local/tomcat/bin/startup.sh


# download and install solr
RUN curl -O http://archive.apache.org/dist/lucene/solr/4.10.4/solr-4.10.4.tgz
RUN tar -zxf solr-4.10.4.tgz

# copy files from solr to tomcat
RUN cp -R solr-4.10.4/dist/solrj-lib/* /usr/local/tomcat/lib/
RUN cp -R solr-4.10.4/example/lib/ext/* /usr/local/tomcat/lib/
RUN cp -R solr-4.10.4/example/resources/log4j.properties /usr/local/tomcat/conf/
RUN cp solr-4.10.4/dist/solr-4.10.4.war /usr/local/tomcat/webapps/solr.war

# create a context file
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost
COPY conf/solr-context.xml /usr/local/tomcat/conf/Catalina/localhost/solr.xml

# Create drupal solr core
RUN mkdir -p /usr/local/tomcat/solr/drupal
COPY conf/drupal /usr/local/tomcat/solr/drupal
COPY conf/solr-core.xml /usr/local/tomcat/solr/solr.xml


# /usr/local/tomcat/bin/shutdown.sh
RUN chown -R tomcat:tomcat /usr/local/tomcat
# RUN sudo -u tomcat /usr/local/tomcat/bin/startup.sh


# Make tomcat automatically start when server reboot
COPY conf/tomcat /etc/init.d/tomcat
RUN sudo chmod +x /etc/init.d/tomcat

# Enable https
COPY conf/server.xml /usr/local/tomcat/conf/server.xml

# Generate self-signed certificate
RUN mkdir /usr/local/tomcat/certs
RUN keytool -genkey -noprompt -keystore /usr/local/tomcat/certs/tomcat.keystore -alias tomcat -keyalg RSA -keysize 4096 -validity 720 -storepass gNckwbGgeQxW6zsE -keypass gNckwbGgeQxW6zsE -dname "CN=Ray Huang, OU=ITS, O=elab, L=NY, S=NY, C=US"
RUN chown -R tomcat:tomcat /usr/local/tomcat

# Forcing https
COPY conf/web.xml /usr/local/tomcat/conf/


# Disable tomcat admin page
COPY conf/index.html /usr/local/tomcat/webapps/ROOT/index.html
COPY conf/index.jsp /usr/local/tomcat/webapps/ROOT/index.jsp


# Add password protection for solr admin page
COPY conf/tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
# COPY conf/solr/web.xml /usr/local/tomcat/webapps/solr/WEB-INF/web.xml


# Start tomcat servlet
CMD [ "/usr/local/tomcat/bin/catalina.sh", "run" ] 
