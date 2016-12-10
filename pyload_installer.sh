#!/bin/bash
sudo apt-get update
sudo apt-get install python-pycurl python-crypto python-qt4 python-imaging tesseract-ocr tesseract-ocr-eng rhino
wget https://github.com/pyload/pyload/releases/download/v0.4.9/pyload-cli-v0.4.9-all.deb
sudo dpkg -i pyload-cli-v0.4.9-all.deb
rm pyload-cli-v0.4.9-all.deb
sudo apt-get clean
pyLoadCore -s

# Lancer Pyload à chaque boot 
# sudo nano /etc/rc.local
# add line `python /usr/share/pyload/pyLoadCore.py –-daemon –-configdir=/home/pi/.pyload`

# service pyload method 1
# sudo nano /etc/init.d/pyload
# replace line $DEAMON --deamon –-configdir=/home/pi/.pyload


# run service pyload as user
sudo nano /etc/systemd/system/pyload.service

# Add this in the file
# [Unit]
# Description=Downloadtool for One-Click-Hoster written in python.
# After=network.target

# [Service]
# ExecStart=/usr/bin/pyLoadCore
# User=$USER should be changed by process owner
# Group=$GROUP should be changed by process owner groups

# [Install]
# WantedBy=multi-user.target

# service pyload method 2
# preinstall pm2 before
cd /usr/share/pyload
pm2 start pyLoadCore.py --name pyload --no-autorestart -- --configdir='/home/pi/.pyload'