FROM debian
LABEL maintainer="Aubrey.S.Lavigne@gmail.com"
# Forked from MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get update \
    && apt-get -y upgrade \
    && apt-get -y install \
        ant \
        apache2 \
        build-essential \
        curl \
        default-jre \
        eclipse \
        git \
        libapache2-mod-python \
        mercurial \
        mongodb \
        openjdk-6* \
        python \
        python-mysqldb \
        python-twisted \
        rabbitmq-server \
        screen \
        subversion \
        tmux \
        vim \
        wget 
    
WORKDIR /usr/local/bin
RUN git clone https://github.com/apache/incubator-wave wave

WORKDIR /usr/local/bin/wave
