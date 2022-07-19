#!/bin/bash


############################# BEGIN  OF installation and configuration of NFS ############################################
#|||=>

# Installtion of nfs-utils  
echo " | Installtion of nfs-utils   >>"
sudo dnf install nfs-utils  -y

# Checking available space 
echo " | Checking available space  >>"
sudo df -h

# Applying configuration for Share registry
echo " | Applying configuration for Share registry  >>"
sudo mkdir -p /shares/registry
sudo chown -R nobody:nobody /shares/registry
sudo chmod -R 777 /shares/registry

# Export Share registry
echo " | Export Share registry  >>"
ip_cluster="172.19.195.0/24"
sudo echo "/shares/registry  $ip_cluster(rw,sync,root_squash,no_subtree_check,no_wdelay)" > /etc/exports
exportfs -rv


# Firewall adding rules
echo " | Firewall adding rules >>"
sudo firewall-cmd --zone=internal --add-service mountd --permanent
sudo firewall-cmd --zone=internal --add-service rpc-bind --permanent
sudo firewall-cmd --zone=internal --add-service nfs --permanent

#  Firewall reload
echo " |  Firewall reload >>"
sudo firewall-cmd --reload

# Enable and start  services 
echo " | Enable and start  services  >>"
sudo systemctl enable nfs-server rpcbind
sudo systemctl start nfs-server rpcbind nfs-mountd

############################# END   OF installation and configuration of NFS ############################################
#|||=>
