#!/bin/bash


############################# BEGIN  OF installation and configuration of APACHE SERVER ############################################
#|||=>

# Installtion of apache-server 
echo " | Installtion of apache-server  >>"
sudo dnf install httpd -y

# Change default listen port to 8080 in httpd.conf
echo " |  Change default listen port to 8080 in httpd.conf >>"
sudo sed -i 's/Listen 80/Listen 0.0.0.0:8080/' /etc/httpd/conf/httpd.conf

# Firewall adding port for Web Server
echo " | Firewall adding port for Web Server >>"
sudo firewall-cmd --add-port=8080/tcp --zone=internal --permanent

#  Firewall reload
echo " |  Firewall reload >>"
sudo firewall-cmd --reload

# Enable and start the service 
echo " | Enable and start the service  >>"
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl status httpd grep Active


# Test the Connection 
echo " | Test the Connection >>"

curl localhost:8080

############################# END   OF installation and configuration of APACHE SERVER ############################################
#|||=>
