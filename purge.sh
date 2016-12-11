#!/bin/bash
sudo apt-get update
sudo apt-get purge wolfram-engine
sudo apt-get autoremove
sudo apt-get clean
sudo apt-get remove --purge libreoffice*
sudo apt-get clean
sudo apt-get autoremove