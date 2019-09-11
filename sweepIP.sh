#!/bin/bash
# SweepIP.sh
# ping Class C IP address one time to get a list of IP address 

echo "What IP range do you wish to sweep for live systems on"
echo "Syntax: 192.168.1"
read ip


if [ "$ip" == "" ] 
        then 
                echo "You forgot an IP Address!"
                echo "Syntax: ./sweepIP.sh 192.168.1"
        else
                for n in `seq 1 254`; do
                ping -c 1  $ip.$n | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" >> "$ip"_list.txt &
        done
fi
