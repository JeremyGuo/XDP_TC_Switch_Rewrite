#!/bin/bash

ip link add dev veth0 type veth peer name veth1
ip link set up veth0
ip link set up veth1
ip addr add 10.0.0.2/24 dev veth0
ip addr add 10.0.0.3/24 dev veth1
echo 1 > /proc/sys/net/ipv4/conf/veth0/accept_local
echo 1 > /proc/sys/net/ipv4/conf/veth1/accept_local
echo 0 > /proc/sys/net/ipv4/conf/all/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/veth0/rp_filter
echo 0 > /proc/sys/net/ipv4/conf/veth1/rp_filter

