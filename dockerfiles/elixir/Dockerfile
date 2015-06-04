FROM ubuntu:14.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && \
    locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get install -y --no-install-recommends apt-transport-https curl ca-certificates && \
# erlang repository
    echo "deb http://binaries.erlang-solutions.com/debian $(lsb_release -cs) contrib" > \
      /etc/apt/sources.list.d/erlang-solutions.list && \
    curl -s "https://packages.erlang-solutions.com/debian/erlang_solutions.asc" | apt-key add - && \
# node repository
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/node $(lsb_release -cs) main" > /etc/apt/sources.list.d/nodesource.list && \
    echo "deb-src https://deb.nodesource.com/node $(lsb_release -cs) main" >> /etc/apt/sources.list.d/nodesource.list && \
# install elixir and nodejs
    apt-get update -qq && \
    apt-get install -y --no-install-recommends elixir nodejs && \
# clean up
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt /var/lib/apt/cache /var/lib/apt/log && \
    rm -fr /tmp/* /var/tmp/*
