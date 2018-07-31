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
    
WORKDIR /Development
RUN hg clone https://wave-protocol.googlecode.com/hg/ wave

WORKDIR /Development/wave
RUN ant -f server-config.xml \
    && ant compile-gwt dist-server \
    && sed -i 's/localhost/0.0.0.0/g' server.config
    
CMD ./run-server.sh
EXPOSE 9898:9898
