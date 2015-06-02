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
rm -rf /var/lib/apt/lists/*


# java
RUN mkdir -p /usr/java/default && \
    curl -Ls 'http://download.oracle.com/otn-pub/java/jdk/7u51-b13/jdk-7u51-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie' | \
    tar --strip-components=1 -xz -C /usr/java/default/
ENV JAVA_HOME /usr/java/default/
ENV PATH $PATH:$JAVA_HOME/bin

# hadoop
RUN curl -s http://www.eu.apache.org/dist/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-2.6.0 hadoop
ENV HADOOP_PREFIX /usr/local/hadoop
RUN export PATH=$PATH:$HADOOP_PREFIX/bin:$HADOOP_PREFIX/sbin
RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/java/default\nexport HADOOP_PREFIX=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_PREFIX/etc/hadoop/hadoop-env.sh


RUN mkdir -p var/run/sshd /var/log/supervisor

COPY ./config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure custom command
ADD ./config/custom_command.sh /custom_command.sh
RUN chmod +x /custom_command.sh

# Enable password-less login
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa
RUN cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# Fix term variable that prevent fish shell fireup properly
# # http://blog.elab.io/2015/05/fish-shell-could-not-set-up-terminal.html
ENV TERM linux


# Some ports are expose for MapReduce 1/2
EXPOSE 8021 8032 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]

