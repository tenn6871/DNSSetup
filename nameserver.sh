#!/bin/bash

a="1.1.1.1"
aa="1.0.0.1"

b=$(cat /etc/resolv.conf | grep nameserver | awk '/1.1.1.1/' | cut -d ' ' -f2)

bb=$(cat /etc/resolv.conf | grep nameserver | awk '/1.0.0.1/' | cut -d ' ' -f2)

#MAIN DNS

if [ "$a" == "$b" ]
then 
	echo "MAIN DNS OK"
else
	echo $(sed -i '2a\nameserver 1.1.1.1\' /etc/resolv.conf)
	echo "MAIN DNS Complete Setup...."
fi

#Sub DNS

if [ "$aa" == "$bb" ]
then
	echo "Sub DNS OK"
else 
	echo $(sed -i '3a\nameserver 1.0.0.1\' /etc/resolv.conf)
	echo "Sub DNS Complete Setup...."
fi

echo ""
echo ""
echo "DNS Currently Set"
echo "MAIN DNS : "$(cat /etc/resolv.conf | grep 1.1.1.1)
echo "Sub DNS : "$(cat /etc/resolv.conf | grep 1.0.0.1)
