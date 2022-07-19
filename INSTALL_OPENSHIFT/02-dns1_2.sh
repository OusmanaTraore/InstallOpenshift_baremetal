#!/bin/bash

############################# BEGIN  OF  DNS installation and configuration (PART 1/2) ############################################
#|||=>
# Installation of utils (bind, bind-utils)
echo " |  Installation of utils (bind, bind-utils) >>"
sudo dnf install bind bind-utils -y

# Applying configuration 
echo " | Applying configuration  >>"
sudo cp ~/makeDirectory/ocp4-metal-install/dns/named.conf /etc/named.conf
sudo cp -r ~/makeDirectory/ocp4-metal-install/dns/zones /etc/named/



echo -n " | Changed the /etc/named.conf file and /etc/named file 
to match your cluster setting !
>>"

############################# END   OF  DNS installation and configuration (PART 1/2) ############################################
#|||=>
