#!/bin/bash

VAR="/root/pull-secret"
if [[ -f $VAR ]]
then

        FILE=`cat $VAR`
        ssh_var=`cat ~/.ssh/install_openshift.pub`

        sed -i "s/ocp.lan/ocp.annuaire.groupe.local/g" ~/makeDirectory/ocp-install/install-config.yaml
        sed -i "s/{\"auths\": ...}/$FILE/g" ~/makeDirectory/ocp-install/install-config.yaml
        sed -i "s/ssh-ed25519 AAAA.../$ssh_var/g" ~/makeDirectory/ocp-install/install-config.yaml
        cat ~/makeDirectory/ocp-install/install-config.yaml
else
        echo " pull-secret is missing"
fi
