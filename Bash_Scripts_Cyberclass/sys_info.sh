#!/bin/bash

#Check if script was run as root. Exit if flase
if [ $UID -ne 0 ]
then
  echo "Please run this script with sudo."
  exit
fi

#Define variables
output=$HOME/research2/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
execs=$(find /home -type -f -perm 777 2> /dev/null)

# Check if research directory is there. Create if needed
if [ ! -d $HOME/research2 ]
then
  mkdir $HOME/research2
fi

#Check for ouput file. Clear it if needed.
if [ -f $output ]
then
  rm $output
fi

echo "A quick system Audit Script" > $output
date >> $output
echo " " >> $output
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname Info: $(uname -a) \n"  >> $output
echo -e "$ip \n" >> $output
echo "Hostname : $(hostname -s) /n " >> $output
echo "DNS Servers: " >> $output
cat /etc/resolv.conf >> $output
free >> $output
echo -e "\nCPU Info:" >> $output
lscpu | grep CPU >> $output
echo -e "\nDisk Usage:" >> $output
df -H | head -2 >> $output
echo -e "\nWho is logged in: \n $(who -a) \n" >> $output
echo -e "\nexec Files:" >> $output
echo $execs >> $output
echo -e "\nTop 10 Processes" >> $output
ps aux --sort -%mem | awk {'print $1, $2, $3, $4, $11'} | head >> $output
fi

#Helpful Loops
files=$('/etc/shadow' '/etc/passwd')
users=$(ls /home)

#Print permissions of each file in your list 
for perm in ${files[@]};
  do
    ls -lah $perm >> $output
  done

#Check sudo permissions of each user that has a home folder
for sudopriv in ${users[@]};
do
    for item in ${sudopriv[@]};
      do
        sudo -lU $item
    done
done
