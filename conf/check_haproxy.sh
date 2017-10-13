#!/bin/bash
#/etc/keepalived/check_haproxy.sh
counter=$(ps -C haproxy --no-heading|wc -l)
if [ "${counter}" = "0" ]; then    
    /sbin/haproxy
    sleep 2
    counter=$(ps -C haproxy --no-heading|wc -l)
    if [ "${counter}" = "0" ]; then
        /sbin/keepalived stop
    fi
fi
