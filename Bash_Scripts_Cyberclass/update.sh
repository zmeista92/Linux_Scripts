#!/bin/bash

#Update apt
apt update -y

#Upgrade all installed packages
apt upgrade -y

#Install new  packages and upgrade the system
apt full-upgrade -y

#Removes unnecessary packages and their associated configs

apt auto-remove --purge -y

#apt update -y && apt upgrade -y && apt full-upgrade -y && apt-get autoremove --purge -y
