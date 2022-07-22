#!/bin/bash


############################# BEGIN  OF installation and configuration of HAPROXY ############################################
#|||=>

# Installtion of haproxy 
echo " | Installtion of haproxy  >>"
sudo dnf install haproxy -y

# Applying configuration 
echo " | Applying configuration  >>"
sudo cp ~/makeDirectory/ocp4-metal-install/haproxy.cfg /etc/haproxy/haproxy.cfg

echo " |Edit the haproxy file   /etc/haproxy/haproxy.cfg to match with your cluster IP >>"
############################# END   OF installation and configuration of HAPROXY ############################################
#|||=>
