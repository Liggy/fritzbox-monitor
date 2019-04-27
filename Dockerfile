FROM debian:buster-slim
MAINTAINER 6050549+Liggy@users.noreply.github.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get update && apt-get -y dist-upgrade && \
    apt-get -y install --no-install-recommends locales mrtg apache2 netcat && \
    apt-get --purge -y autoremove && \
    apt-get clean && \
    rm /var/www/html/index.html && \
    rm -r /var/lib/apt/lists/*

COPY assets/ /

CMD ["/usr/local/bin/fbm"]

