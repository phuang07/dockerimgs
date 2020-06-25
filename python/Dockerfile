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

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    DEBIAN_FRONTEND=noninteractive apt-get -qq -y install \
    apt-utils \
    wget \
    nodejs \
    npm

EXPOSE 8888

COPY ./src /src
WORKDIR /src
RUN pip install -r requirements.txt
# This command faild to build for some reasons
#RUN jupyter labextension install @jupyterlab/katex-extension

#Execution
CMD python hello_python.py
