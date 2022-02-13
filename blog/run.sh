#!/usr/bin/env bash

/etc/init.d/ssh restart > /var/log/sshd.log 2>&1 &

rsync --daemon > /var/log/rsyncd.log 2>&1 &

nginx -c /etc/nginx/nginx.conf > /var/log/nginx.log 2>&1 &

while [ true ]; do
    sleep 1
done
