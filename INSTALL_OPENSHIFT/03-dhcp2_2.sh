#!/bin/bash


############################# BEGIN  OF installation and configuration of DHCP PART(2/2) ############################################
#|||=>

sudo firewall-cmd --add-service=dhcp --zone=internal --permanent
sudo firewall-cmd --reload

# Enable and start the service 
echo " | Enable and start the service  >>"
sudo systemctl enable dhcpd
sudo systemctl start dhcpd
sudo systemctl status dhcpd

############################# END   OF installation and configuration of DHCP PART(2/2) ############################################
#|||=>
