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

# service pyload
# sudo nano /etc/init.d/pyload
# replace line $DEAMON --deamon –-configdir=/home/pi/.pyload


