#!/bin/sh

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun


## Setup proper dns routes
echo "nameserver 1.1.1.1" > /etc/resolv.conf

cd /vpn

exec /bin/bash

