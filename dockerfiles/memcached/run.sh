#!/bin/bash -ex
/usr/bin/memcached -u nobody -m ${MEMCACHED_MEMORY} -vv >> /var/log/memcached 2>&1
