#!/bin/bash
#Downloading nifi package for redhat 7.4
wget http://mirrors.estointernet.in/apache/nifi/1.8.0/nifi-1.8.0-bin.tar.gz
tar -xvf nifi-1.8.0-bin.tar.gz
yum install java -y
export JAVA_HOME=/usr/lib/jvm/java-1.8.0-ibm-1.8.0.5.25-1jpp.1.el7.x86_64/jre
cd nifi-1.8.0
bin/nifi.sh install
bin/nifi.sh start
iptables -F
