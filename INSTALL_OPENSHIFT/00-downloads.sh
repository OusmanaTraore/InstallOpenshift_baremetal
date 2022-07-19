#!/bin/bash

############################# BEGIN  OF installation utils ############################################
#|||=>
 mkdir ~/makeDirectory
 cd ~/makeDirectory

 dnf update
 dnf install git tree -y

 git clone https://github.com/ryanhay/ocp4-metal-install

############################# END   OF installation and configuration of DHCP #########################################
############################# BEGIN OF DOWNLOADS OPENSHIFT-INSTALL OPENSHIFT-CLIENT , ISO #############################

if [[ -d Downloads ]]
then
    echo " Downloads directory already exists!"
    break
else 
     mkdir Downloads
     echo " | CHANGE DIRECTORY => Downloads >>"
     cd Downloads
fi


# Opensfhit installer
echo " | téléchargement de openshift installer >>"
 curl   https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-install-linux.tar.gz  | tar -xz


# command line tool CLI
echo " | téléchargement de command line tool CLI >>"
#curl  https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-windows.zip 

 curl  https://mirror.openshift.com/pub/openshift-v4/x86_64/clients/ocp/stable/openshift-client-linux.tar.gz | tar -xz



# Red Hat Enterprise Linux CoreOs(RHCOS)
echo " | téléchargement de Red Hat Enterprise Linux CoreOs(RHCOS) >>"

wget  https://mirror.openshift.com/pub/openshift-v4/x86_64/dependencies/rhcos/latest/rhcos-live.x86_64.iso

 cd ~
 tree makeDirectory
############################# END OF DOWNLOADS OPENSHIFT-INSTALL OPENSHIFT-CLIENT , ISO #############################
#|||=>
############################# BEGIN OF CHECKING CLIENT TOOLS ARE WORKING ############################################
sleep 2

#Checking  Version
echo " | Checking  Version >>"
 mv makeDirectory/Downloads/oc makeDirectory/Downloads/kubectl /usr/local/bin

 oc version 
 kubectl version

############################# END   OF CHECKING CLIENT TOOLS ARE WORKING ############################################
#|||=>
############################# BEGIN OF  #############################
############################# END   OF  #############################