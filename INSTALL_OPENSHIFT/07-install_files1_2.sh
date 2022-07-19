#!/bin/bash


############################# BEGIN  OF generating config FILES (PART 1/2) ############################################
#|||=>

# Generate ssh-key  
echo " | Generate ssh-key   >>"
sudo ssh-keygen -t ed25519 -N '' -f  ~/.ssh/install_openshift
sudo eval $(ssh-agent -s)
sudo ssh-add ~/.ssh/install_openshift

# Creating Install Directory 
echo " | Creating Install Directory  >>"
sudo mkdir ~/makeDirectory/ocp-install
sudo cp ~/makeDirectory/ocp4-metal-install/install-config.yaml ~/makeDirectory/ocp-install

sudo mkdir ~/makeDirectory/saveInstall
sudo cp -R ~/makeDirectory/ocp-install  ~/makeDirectory/saveInstall
sudo mv ~/makeDirectory/saveInstall/ocp-install ~/makeDirectory/saveInstall/ocp-install_00


# Update the Install-config yaml with the pull-secret and ssh-key 
echo -e " ||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 Update the Install-config yaml with the pull-secret and ssh-key 
 |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
 >>"

############################# END   OF generating config FILES (PART 1/2) ############################################
#|||=>
