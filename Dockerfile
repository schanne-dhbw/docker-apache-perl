FROM ubuntu:20.04

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Berlin"
RUN \
    apt-get update && \
    apt-get install -y --no-install-recommends \
        joe git apt-utils \
        wget curl ca-certificates \
        build-essential \
        apt-utils \
        ssl-cert \
        apache2 \
        apache2-utils \
        apache2-dev \
        libapache2-mod-perl2 \
        libapache2-mod-perl2-dev \
        libcgi-pm-perl \
        liblocal-lib-perl \
        cpanminus \
        libexpat1-dev \
        libssl-dev \
        libapreq2-dev \
        zip && \
    a2enmod cgid && \
    a2enmod cgi && \
    a2enmod rewrite && \
    a2dissite 000-default && \
    apt-get update -y && \
    apt-get -y clean && \
    apt-get install -y openjdk-11-jdk maven

RUN wget https://scala-lang.org/files/archive/scala-2.13.4.tgz -P /tmp
RUN tar xzf /tmp/scala-2.13.4.tgz -C /usr/local/share
RUN export PATH=$PATH:/usr/local/share/scala-2.13.4/bin
RUN ln -s /usr/local/share/scala-2.13.4/bin/* /usr/local/bin

RUN curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > /tmp/lein
RUN chmod a+x /tmp/lein
RUN mv /tmp/lein /usr/local/bin
RUN curl -O https://download.clojure.org/install/linux-install-1.10.1.536.sh
RUN chmod +x linux-install-1.10.1.536.sh
RUN ./linux-install-1.10.1.536.sh
RUN rm -f linux-install-1.10.1.536.sh
RUN rm -rf /tmp/*
RUN apt-get install -y rlwrap

RUN rmdir /usr/lib/cgi-bin
RUN ln -s /var/www/html/cgi-bin/ /usr/lib/cgi-bin

COPY localhost.conf /etc/apache2/sites-enabled/localhost.conf

VOLUME ["/var/www/html"]

EXPOSE 80
