#!/bin/bash

dnf -y install python3 git nginx 

firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent
firewall-cmd --reload