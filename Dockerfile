FROM debian:buster-slim
MAINTAINER 6050549+Liggy@users.noreply.github.com

RUN export DEBIAN_FRONTEND=noninteractive && \
    ln -sf /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get -y install locales cron mrtg apache2 netcat && \
    rm /var/www/html/index.html

COPY assets/upnp2mrtg.sh /usr/local/bin
COPY assets/mrtg.cfg /etc
COPY assets/mrtg-cron /etc/cron.d/mrtg

CMD /bin/sh -c "service cron start; service apache2 start; while true; do echo Hello world; sleep 3600; done"

