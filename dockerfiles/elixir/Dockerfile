FROM ubuntu:14.04

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive && \
    locale-gen en_US.UTF-8 && \
    apt-get update && \
    apt-get install -y --no-install-recommends curl ca-certificates && \
    echo "deb http://binaries.erlang-solutions.com/debian trusty contrib" > \
      /etc/apt/sources.list.d/erlang-solutions.list && \
    curl -s "https://packages.erlang-solutions.com/debian/erlang_solutions.asc" | apt-key add - && \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends elixir && \
    apt-get autoremove -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt /var/lib/apt/cache /var/lib/apt/log && \
    rm -fr /tmp/* /var/tmp/*
