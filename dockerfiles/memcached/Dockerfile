FROM debian:wheezy
MAINTAINER Jose Coelho <jose.coelho@linkedcare.com>

ENV MEMCACHED_MEMORY 64

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
      procps \
      memcached && \
    apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    rm -rf /tmp/* /var/tmp/*

COPY run.sh /run.sh

RUN chmod 755 /*.sh

CMD [ "/run.sh" ]

EXPOSE 11211
