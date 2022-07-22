#!/bin/bash


############################# BEGIN  OF installation and configuration of HAPROXY ############################################
#|||=>


# Firewall adding port for Haproxy
echo " | Firewall adding port for Haproxy >>"
echo " |Adding port 6443 zone insternal to firewalld >> "
sudo firewall-cmd --add-port=6443/tcp --zone=internal --permanent # kube-api-server on control plane nodes

echo " |Adding port 6443 zone external to firewalld >> "
sudo firewall-cmd --add-port=6443/tcp --zone=external --permanent # kube-api-server on control plane nodes

echo " |Adding port 22623 zone internal to firewalld >> "
sudo firewall-cmd --add-port=22623/tcp --zone=internal --permanent # machine-config server

echo " |Adding service http zone internal to firewalld >> "
sudo firewall-cmd --add-service=http --zone=internal --permanent # web services hosted on worker nodes

echo " |Adding service http zone external to firewalld >> "
sudo firewall-cmd --add-service=http --zone=external --permanent # web services hosted on worker nodes

echo " |Adding service https zone internal to firewalld >> "
sudo firewall-cmd --add-service=https --zone=internal --permanent # web services hosted on worker nodes

echo " |Adding service https zone external to firewalld >> "
sudo firewall-cmd --add-service=https --zone=external --permanent # web services hosted on worker nodes

echo " |Adding port 9000 zone external to firewalld >> "
sudo firewall-cmd --add-port=9000/tcp --zone=external --permanent # HAProxy Stat

#  Firewall reload
echo " |  Firewall reload >>"
sudo firewall-cmd --reload

# Enable and start the service 
echo " | Enable and start the service  >>"
sudo setsebool -P haproxy_connect_any 1 # SELinux name_bind access
sudo systemctl enable haproxy
sudo systemctl start haproxy
sudo systemctl status haproxy | grep Active

############################# END   OF installation and configuration of HAPROXY ############################################
#|||=>
