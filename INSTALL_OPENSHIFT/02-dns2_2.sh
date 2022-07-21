#!/bin/bash

############################# BEGIN  OF  DNS installation and configuration (PART 2/2) ############################################
#|||=>

# Firewall adding port for DNS
echo " | Firewall adding port for DNS >>"
sudo firewall-cmd --add-port=53/udp --zone=internal --permanent
# for OCP 4.9 and later 53/tcp is required
sudo firewall-cmd --add-port=53/tcp --zone=internal --permanent

#  Firewall reload
echo " |  Firewall reload >>"
sudo firewall-cmd --reload

# Enable and start the service 
echo " | Enable and start the service  >>"
sudo systemctl enable named
sudo systemctl start named
sudo systemctl status named | grep Active

# Using local DNS
echo -n " | Change the LAN nic (ens192) to use 127.0.0.1 for DNS AND
ensure Ignore automatically Obtained DNS parameters is ticked !
you can use nmtui  >>"

############################# END   OF  DNS installation and configuration (PART 2/2) ############################################
#|||=>
