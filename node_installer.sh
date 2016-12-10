#!/bin/bash
wget https://nodejs.org/dist/v4.0.0/node-v4.0.0-linux-armv7l.tar.gz 
tar -xvf node-v4.0.0-linux-armv7l.tar.gz 
cd node-v4.0.0-linux-armv7l
sudo cp -R * /usr/local/
rm -r node-v4.0.0-linux-armv7l
rm node-v4.0.0-linux-armv7l.tar.gz