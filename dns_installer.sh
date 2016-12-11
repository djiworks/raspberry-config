#!/bin/bash
sudo apt-get update
sudo apt-get install bind9
sudo apt-get clean


cd /etc/bind/
sudo cp named.conf.local named.conf.local.bak
sudo service bind9 stop
sudo nano named.conf.local

# zone "blackhole.org" {
# type master;
# file "/etc/bind/db.blackhole";
# allow-update { none; };
# };
#
# // De ́claration de la zone inverse a` ≪ blackhole ≫
# zone "0.168.192.in-addr.arpa" {
# type master;
# file "/etc/bind/db.inverse.blackhole";
# allow-update { none; };
# };

sudo cp db.empty db.blackhole


named-checkzone blackhole.org db.blackhole.org
named-checkconf named.conf.options
sudo nano /etc/resolv.conf

# search blackhole.org
# domain blackhole.org
# nameserver 192.168.0.2
# comment all other nameserver

sudo /etc/init.d/networking restart
ping blackhole.org
# return 192.168.0.2

# ??? dns inverse

cd /home/pi/Downloads
wget -O blackhole.conf "https://pgl.yoyo.org/adservers/serverlist.php?hostformat=bindconfig&showintro=0&mimetype=plaintext&zonefilename=/etc/bind/db.blackhole"
sudo cp blackhole.conf /etc/bind
sudo nano named.conf
#include "/etc/bind/blackhole.conf";