#!/bin/bash


############################# BEGIN  OF getting sha512sum of .ign files  ############################################
#|||=>

# Sending sha512sum  bootstrap.ign file for deployment
echo " | Sending sha512sum  bootstrap.ign file for deployment   >>"
export shaboot=$(cat sha_boot_final)
sed -i -e "7a shaBoot=\"$shaboot\"" 09-deploy_Openshift.sh

# Sending sha512sum  worker.ign file for deployment
echo " | Sending sha512sum  worker.ign file for deployment  >>"
export shamaster=$(cat sha_master_final)
sed -i -e "8a shaMaster=\"$shamaster\"" 09-deploy_Openshift.sh

# Sending sha512sum  worker.ign file for deployment
echo " | Sending sha512sum  worker.ign file for deployment  >>"
export shaworker=$(cat sha_worker_final)
sed -i -e "9a shaWorker=\"$shaworker\"" 09-deploy_Openshift.sh

# Checking availability of sha512sum  (bootstrap.ign, master.ign, worker.ign) for deployment
echo " | Checking availability of sha512sum  (bootstrap.ign, master.ign, worker.ign) for deployment  >>"
test(){
  IFS=":"
  vm="shaboot:shamaster:shaworker" 
  for var in $vm
  do
      test=$( grep $var 09-deploy_Openshift.sh | cut -d "\"" -f 2)
      if [[   -z $test  ]] # test si la chaine est vide
           then 
            echo "availability of sha512sum for $var : FAILED"
      elif [[ -n $test ]] # test si la chaine  n'est  pas vide
          then
           echo "availability of sha512sum for $var : SUCCEED"
      fi
  done
}

#test
############################# END   OF getting sha512sum of .ign files ############################################
#|||=>
