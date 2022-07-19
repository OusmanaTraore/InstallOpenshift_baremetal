#!/bin/bash


############################# BEGIN  OF Deploying to NODE ############################################
#|||=>
ip_cluster="172.19.195.153"
shaBoot="b69251d218afe2983af55ee6b553efba1bd36dd1d2ebd8ca320a0086ac6a74cc5b731b9f4702cf3f8cd35b5c1f089e1952077f887abc568e65f6a9a1b91de815"
shaMaster="a67668f339b4d7e95addfee85246a9fe70a348f5352e98cb14bd832d551c1814a08e6c6a1b9dd8d170a962f01840f0fb16329370b14931cba2f40176fe437952"
shaWorker="d9a771f00d215cbe78df2007e136090c9a6740f5e19cf4a2ebe74f2da9efb536e97d8ab9e2c619a1c22bcb54e38b2ebe1f9dec3396371261afa75b69b9fd20a8"
if [[ $shaBoot = "" ]] 
then 
    echo " du bootstrap  sha512 is empty"
elif [[ $shaMaster = "" ]]
then
    echo " du master  sha512 is empty"
elif [[ $shaWorker = "" ]]
then
    echo " du master  sha512 is empty"
else
    select ocp_sha in bootstrap master worker 
    do
        if [[ $ocp_sha = "bootstrap" ]] 
        then
            echo "you chose bootstrap ";
            echo " | deploying to  bootstrap node >>"
            sudo coreos-installer install --ignition-url=http://$ip_cluster:8080/ocp4/bootstrap.ign /dev/sda --ignition-hash=sha512-$shaBoot
            break;
        elif [[ $ocp_sha = "master"  ]] 
        then
            echo "you chose master ";
            echo " | deploying to  master node >>"
            sudo coreos-installer install --ignition-url=http://$ip_cluster:8080/ocp4/master.ign /dev/sda --ignition-hash=sha512-$shaMaster
            break;
        elif [[ $ocp_sha = "worker"  ]] 
        then
            echo "you chose worker ";
            echo " | deploying to  worker node >>"
            sudo coreos-installer install --ignition-url=http://$ip_cluster:8080/ocp4/worker.ign /dev/sda --ignition-hash=sha512-$shaWorker
            break;
        else
            echo "Please select one correct option"; 
            break;
        fi
    done
fi

############################# END   OF Deploying to NODE ############################################
#|||=>
