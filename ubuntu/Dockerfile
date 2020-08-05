FROM ubuntu:18.04

# Based on https://github.com/matthewfeickert/Docker-Python3-Ubuntu/blob/master/Dockerfile
MAINTAINER Patrick Ray. Huang

USER root

SHELL [ "/bin/bash", "-c" ]

ARG PYTHON_VERSION_TAG=3.8
ARG LINK_PYTHON_TO_PYTHON3=1

ARG NODE_VERSION_TAG=12.16.3

# Existing lsb_release causes issues with modern installations of Python3
# https://github.com/pypa/pip/issues/4924#issuecomment-435825490
# Set (temporarily) DEBIAN_FRONTEND to avoid interacting with tzdata
RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
        gcc \
        g++ \
        zlibc \
        zlib1g-dev \
        libssl-dev \
        libbz2-dev \
        libsqlite3-dev \
        libncurses5-dev \
        libgdbm-dev \
        libgdbm-compat-dev \
        liblzma-dev \
        libreadline-dev \
        uuid-dev \
        libffi-dev \
        tk-dev \
        wget \
        curl \
        git \
        make \
        sudo \
        bash-completion \
        tree \
        vim \
        libgraphviz-dev \
        pkg-config \
	graphviz \
        ca-certificates \
        apt-transport-https \
        software-properties-common && \
    mv /usr/bin/lsb_release /usr/bin/lsb_release.bak && \
    apt-get -y autoclean && \
    apt-get -y autoremove && \
    rm -rf /var/lib/apt-get/lists/*

# Install docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN apt-get install docker-ce docker-ce-cli containerd.io

# Python stuffs
COPY install_python.sh install_python.sh
COPY pip_packages.txt pip_packages.txt
RUN bash install_python.sh ${PYTHON_VERSION_TAG} ${LINK_PYTHON_TO_PYTHON3}

COPY init.sh /home/docker/init.sh
RUN chmod +rx /home/docker/init.sh

# Create user "docker" with sudo powers
RUN useradd -m docker && \
    usermod -aG sudo docker && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/docker/ && \
    mkdir /home/docker/data && \
    chown -R --from=root docker /home/docker

# Use C.UTF-8 locale to avoid issues with ASCII encoding
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

WORKDIR /home/docker/data
ENV HOME /home/docker
ENV USER docker
USER docker
ENV PATH /home/docker/.local/bin:$PATH
# Avoid first use of sudo warning. c.f. https://askubuntu.com/a/22614/781671
RUN touch $HOME/.sudo_as_admin_successful

# Nodejs stuffs
COPY install_node.sh install_node.sh
RUN bash install_node.sh ${NODE_VERSION_TAG}

CMD [ "/bin/bash" ]
