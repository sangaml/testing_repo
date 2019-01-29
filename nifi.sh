#!/bin/bash
#Downloading nifi package for redhat 7.4
wget http://mirrors.estointernet.in/apache/nifi/1.8.0/nifi-1.8.0-bin.tar.gz
tar -xvf nifi-1.8.0-bin.tar.gz
yum install java -y
cd nifi-1.8.0
bin/nifi.sh install
bin/nifi.sh run
bin/nifi.sh start
iptables -F
