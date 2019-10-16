#!/bin/bash

# Author: Weekend Class of March 2019
# Description: This script will modify the iptables
# Date: 08/11/2019 06:14:24 PM

Pattern1="tcp -p tcp --dport 22"
Pattern2="-A INPUT -m state --state NEW -m $1 -p $1 --dport $2 -j ACCEPT"
Pattern3="/etc/sysconfig/iptables"

## Check if a user is a root user


if

        [[ $UID -ne 0 ]]

   then

echo -e "\n Please run this command as root user \n"

exit 1
fi

## Check number of arguments

if [[ $# -ne 2 ]]
then
echo -e "\n Please provide two arguments after the script name \n"
echo
echo -e "\n Example of arguments after the script name is: $0 udp 23 or tcp 80 \n"

exit 1

fi


 echo $2 | grep -Eq '^()?[0-9]+$'

if [[ $? -eq 0 ]]

then

echo -e "\n $2 is a digit. Modifying the iptables...\n"

sleep 5

sed -i "/${Pattern1}/a ${Pattern2}" ${Pattern3}

else

echo -e "\n Sorry, but you must provide the right arguments. e.g tcp 23 or udp 56 \n"

exit 1

fi
