#!/bin/bash


############################# BEGIN  OF installation and configuration of DHCP PART(1/2) ############################################
#|||=>

# Restart NetworkManager
echo " |  Restart NetworkManager >>"
sudo dnf install bind bind-utils -y
sudo systemctl restart NetworkManager

# Installtion of dhcp-server 
echo " | Installtion of dhcp-server  >>"
sudo dnf install dhcp-server -y

# Edit dhcp.conf file to match IPaddress and name of cluster machines
echo " | Edit dhcp.conf file to match IPaddress and name of cluster machines >>"
sudo cp ~/makeDirectory/ocp4-metal-install/dhcpd.conf /etc/dhcp/dhcpd.conf
sleep 2

############################# END   OF installation and configuration of DHCP PART(1/2) ############################################
#|||=>
