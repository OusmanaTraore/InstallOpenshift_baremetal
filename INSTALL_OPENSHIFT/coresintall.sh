#!/bin/bash

IFS=":"
VMS="bootstrap:master:worker"

for var in VMS
do 
	sudo coreos. inst. install_dev=sda coreos. inst. image_url=http://172.19.195.153:8080/ocp4/rhcos coreos. inst. ignition_url=http://172.19.195.153:8080/ocp4/$var.ign

done

