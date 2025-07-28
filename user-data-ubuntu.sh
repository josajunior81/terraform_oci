#!/bin/bash

apt update -y
apt install -y python3-pip python3-venv python3-dev python3 \
    build-essential libssl-dev libffi-dev python3-setuptools nginx git


# /etc/iptables/rules.v4
# iptables-restore < /etc/iptables/rules.v4

# iptables -I INPUT 6 -m state --state NEW -p tcp --dport 80 -j ACCEPT
# netfilter-persistent save    