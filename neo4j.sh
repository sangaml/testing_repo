#!/bin/bash
wget -O - https://debian.neo4j.org/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.org/repo stable/' | sudo tee /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
apt-get install neo4j
systemctl  start neo4j.service
systemctl  enable neo4j.service
iptables -F
