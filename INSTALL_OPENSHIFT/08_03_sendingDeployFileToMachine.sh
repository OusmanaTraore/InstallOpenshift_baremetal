#!/bin/bash
IFS=":"
machine="ocp-bootstrap:ocp-cp-1:ocp-cp-2:ocp-cp-3:ocp-w-1:ocp-w-2"
count=4
echo "| Please start all machines (bootstrap, and control plane)"
for var in $machine
do
  echo "| Sending Deploy file to node $var"
  `scp 09-deploy_Openshift.sh core@172.19.195.15$count`
  ((count++))
done
