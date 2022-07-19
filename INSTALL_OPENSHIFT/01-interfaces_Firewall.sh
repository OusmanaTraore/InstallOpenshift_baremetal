#!/bin/bash

ens0="eth0"
ens1="eth2"
############################# BEGIN  OF creating internal and external zones ############################################
#|||=>
# Modify connection zones (internal and external)
echo " |  Modify connection zones (internal and external) >>"
sudo nmcli connection modify $ens0 connection.zone external
sudo nmcli connection modify $ens1 connection.zone internal

# Starting Firewall  
echo " | Starting Firewall    >>"
systemctl enable firewalld
systemctl start firewalld
systemctl status firewalld

# Getting Firewall  zones 
echo " | Getting Firewall  zones  >>"
sudo firewall-cmd --get-active-zones

# Firewall adding masqueradd
echo " | Firewall adding masqueradd >>"
sudo firewall-cmd --zone=external --add-masquerade --permanent
sudo firewall-cmd --zone=internal --add-masquerade --permanent

#  Firewall reload
echo " |  Firewall reload >>"
sudo firewall-cmd --reload

# Checking Firewall zone 
echo " | Checking Firewall zone  >>"
sudo firewall-cmd --list-all --zone=internal
sudo firewall-cmd --list-all --zone=external

# Checking Firewall ipv4_forward
echo " | Checking Firewall ipv4_forward >>"
sudo cat /proc/sys/net/ipv4/ip_forward


############################# END   OF creating internal and external zones ############################################
#|||=>
