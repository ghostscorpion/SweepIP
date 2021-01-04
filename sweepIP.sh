#!/bin/bash
# SweepIP.sh
# ping Class C IP address one time to get a list of IP address
# By Ghostscorpion

echo "What IP range do you wish to sweep for live systems on"
echo "Enter the first three octets of the IP range."
echo "Syntax: 192.168.1"
read ip

if [ "$1" == "" ]
then
  echo "Need first three octets of the IP address."
  echo "Syntax : ./ipsweep.sh 192.168.1"

else
 for ip in {1..254};
  do
   ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
 done
fi
