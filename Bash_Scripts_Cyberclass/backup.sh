#!/bin/bash

#Create /var/backup, if it doesnt exist
mkdir -p /var/backup

#Create new /var/backup/home.tar
tar cvf /var/backup/home.tar /home

#Moving /var/backup/home.tar to /var/backup/home/
mv /var/backup/home.tar /var/backup/home.01152022.tar

#Listing all files in /var/backup
ls -lh /var/backup > /var/backup/file_report.txt

#Prints how much free memory the machine has left
free -h > /var/backup/disk_report.txt
