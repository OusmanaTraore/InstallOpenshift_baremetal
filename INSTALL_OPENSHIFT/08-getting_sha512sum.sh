#!/bin/bash


############################# BEGIN  OF getting sha512sum of .ign files ############################################
#|||=>

# Getting sha512sum of bootstrap.ign file 
echo " | Getting sha512sum of bootstrap.ign file  >>"
sha512sum ~/makeDirectory/ocp-install/bootstrap.ign > sha_boot_ori
cat sha_boot_ori | cut -d " " -f1 > sha_boot_final
# Getting sha512sum of master.ign file 
echo " | Getting sha512sum of master.ign file  >>"
sha512sum ~/makeDirectory/ocp-install/master.ign  > sha_master_ori
cat sha_master_ori | cut -d " " -f1 > sha_master_final
# Getting sha512sum of worker.ign file 
echo " | Getting sha512sum of worker.ign file  >>"
sha512sum ~/makeDirectory/ocp-install/worker.ign  > sha_worker_ori
cat sha_worker_ori | cut -d " " -f1 > sha_worker_final

############################# END   OF getting sha512sum of .ign files ############################################
#|||=>
