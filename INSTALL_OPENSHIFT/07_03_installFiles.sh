#!/bin/bash

############################# BEGIN  OF generating config FILES (PART 2/2) ############################################
#|||=>

# Generates Kubernetes Manifests files 
echo " | Generates Kubernetes Manifests files  >>"
cp ~/makeDirectory/openshift-install .
./openshift-install create manifests --dir ~/makeDirectory/ocp-install

# Rendre le master No schedulabe 
echo " | Rendre le master No schedulabe  >>"
sed -i ' s/mastersSchedulable: true/mastersSchedulable: false/' ~/makeDirectory/ocp-install/manifests/cluster-scheduler-02-config.yml
sleep 2 
cat 
sudo cp -R ~/makeDirectory/ocp-install  ~/makeDirectory/saveInstall
sudo mv ~/makeDirectory/saveInstall/ocp-install ~/makeDirectory/saveInstall/ocp-install_01

sleep 2
# Generates Kubernetes ignition files 
echo " | Generates Kubernetes ignition files  >>"
./openshift-install create ignition-configs --dir ~/makeDirectory/ocp-install

sudo cp -R ~/makeDirectory/ocp-install  ~/makeDirectory/saveInstall
sudo mv ~/makeDirectory/saveInstall/ocp-install ~/makeDirectory/saveInstall/ocp-install_02

# Creating a hosting directory to serve the configuration files 
echo " | Creating a hosting directory to serve the configuration files  >>"
mkdir /var/www/html/ocp4

cp -R ~/makeDirectory/ocp-install/* /var/www/html/ocp4

# Moving the CoreOs image to the web server directory 
echo " | Moving the CoreOs image to the web server directory  >>"
mv ~/makeDirectory/rhcos-* /var/www/html/ocp4/rhcos

# Change the ownership and permissions of the web server directory
echo " | Change the ownership and permissions of the web server directory  >>"
chcon -R -t httpd_sys_content_t /var/www/html/ocp4/
chown -R apache: /var/www/html/ocp4/
chmod 755 /var/www/html/ocp4/


# Checking access files 
echo " | Checking access files   >>"
curl localhost:8080/ocp4/

############################# END   OF generating config FILES (PART 2/2) ############################################
#|||=>
