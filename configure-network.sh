#!/bin/bash
echo "Please Enter Hostname"

read hanahost

echo "Please Enter IP Address"

read ipaddress

echo "Please Enter Subnet Mask eg 255.255.255.0"

read varsubnetmask

echo "Please Enter Network Address eg 10.0.0.0"

read networkadd

echo "Please Enter Domain Name eg domain.local"

read domname

echo "Please Enter DNS Server IP"

read dnsip

echo "Please Enter Default Gateway IP"

read dgwip

hostnamectl set-hostname $hanahost

sed -i "s/IP_VAR/$ipaddress/g" ~/networkinputfile
sed -i "s/HOST_VAR/$hanahost/g" ~/networkinputfile
sed -i "s/NETMASK_VAR/$varsubnetmask/g" ~/networkinputfile
sed -i "s/SUBMASK_VAR/$varsubnetmask/g" ~/networkinputfile
sed -i "s/NETWORK_VAR/$networkadd/g" ~/networkinputfile 

sed -i "s/DOMNAME_VAR/$domname/g" ~/config.var
sed -i "s/DNS_VAR/$dnsip/g" ~/config.var

sed -i "s/DGW_VAR/$dgwip/g" ~/routes.var

cp ~/config.var /etc/sysconfig/network/config

cp ~/networkinputfile /etc/sysconfig/network/ifcfg-eth0

cp ~/routes.var /etc/sysconfig/network/routes

