# Reference: https://github.com/gauthamp10/dockerfile-boilerplates/tree/master/python
FROM python:3.8-slim
#Build args
ARG VCS_REF
ARG BUILD_DATE
# Setting resource quota
ARG MIN_MEM=2G
ARG MAX_MEM=2G
#Adding Labels of build
LABEL maintainer="phuang07 <github.com/phuang07/dockerimgs>"
LABEL org.label-schema.build-date=$BUILD_DATE
LABEL org.label-schema.vcs-url="https://github.com/phuang07/dockerimgs"
LABEL org.label-schema.vcs-ref=$VCS_REF

ENV \
        # UID="1000" \
        # GID="1000" \
        UNAME="docker" \
        GNAME="docker" \
        SHELL="/bin/bash" \
	PATH="/home/docker/.local/bin:${PATH}"


RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
    apt-utils \
    wget \
    sudo \
    nodejs \
    libgmp-dev \
    libmpfr-dev \
    libmpc-dev \
    gcc \
    pandoc \
    texlive \
    texlive-xetex \
    texlive-generic-extra \
    texlive-generic-recommended \
    npm

EXPOSE 8888

COPY ./src /src
WORKDIR /src
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt
# RUN jupyter labextension install @kiteco/jupyterlab-kite


# Create user "docker" with sudo powers
RUN useradd -m "${UNAME}" && \
    usermod -aG sudo "${UNAME}" && \
    echo '%sudo ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    cp /root/.bashrc /home/"${UNAME}"/ && \
    mkdir /home/"${UNAME}"/.config && \
    chown -R --from=root "${UNAME}" /home/"${UNAME}"

WORKDIR /home/"${UNAME}"/docs
ENV HOME /home/"${UNAME}"
ENV USER "${UNAME}"
USER "${UNAME}"

#Execution
CMD python hello_python.py
