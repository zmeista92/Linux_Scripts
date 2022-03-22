#!/bin/bash

#Prints the amount of free memory on the system and saves it to ~/backups/freemem/free_mem.txt
free -h >> ~/backups/freemem/free_mem.txt

#Prints disk usage and saves it to ~/backups/diskuse/disk_usage.txt
du -h >> ~/backups/diskuse/disk_usage.txt

#Lists all open files and saves it to ~/backups/openlist/open_list.txt
lsof >> ~/backups/openlist/open_list.txt

#Prints file system disk space statistics and saves it to ~/backups/freedisk/free_disk.txt
df -h >> ~/backups/freedisk/free_disk.txt
