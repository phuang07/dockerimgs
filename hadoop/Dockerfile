FROM ubuntu:14.04

# Update and install dependencies
RUN apt-get -y install --reinstall software-properties-common && \
add-apt-repository ppa:webupd8team/java && \
apt-get update && \
apt-get -y install curl && \
DEBIAN_FRONTEND=noninteractive && \ 
# Install supervisor to enable manage multiple process within a container
# reference: https://docs.docker.com/articles/using_supervisord/
apt-get -y install supervisor && \
apt-get -y install openssh-server && \
apt-get -y install fish && \
apt-get -y install vim && \
apt-get -y install oracle-java7-installer && \
rm -rf /var/lib/apt/lists/*


# Select Sun's Java as the default on your machine.
# # See 'sudo update-alternatives --config java' for more information.
RUN update-java-alternatives -s java-7-oracle
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle/jre/bin/java

ADD ./config/hadoop-1.2.1 /etc/hadoop-1.2.1
ENV HADOOP_INSTALL /etc/hadoop-1.2.1
ENV PATH /etc/hadoop-1.2.1/bin:/etc/hadoop-1.2.1/sbin:$PATH


RUN mkdir -p var/run/sshd /var/log/supervisor

COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure custom command
ADD ./config/custom_command.sh /custom_command.sh
RUN chmod +x /custom_command.sh

# Enable password-less login
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Some ports are expose for MapReduce 1/2
EXPOSE 8021 8032 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

