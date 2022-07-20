#!/bin/bash


############################# BEGIN  OF Deploying to NODE ############################################
#|||=>
ip_cluster="172.19.195.153"

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
