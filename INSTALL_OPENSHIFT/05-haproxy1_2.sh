#!/bin/bash


############################# BEGIN  OF installation and configuration of HAPROXY ############################################
#|||=>

# Installtion of haproxy 
echo " | Installtion of haproxy  >>"
sudo dnf install haproxy -y

# Applying configuration 
echo " | Applying configuration  >>"
sudo cp ~/ocp4-metal-install/haproxy.cfg /etc/haproxy/haproxy.cfg


############################# END   OF installation and configuration of HAPROXY ############################################
#|||=>
