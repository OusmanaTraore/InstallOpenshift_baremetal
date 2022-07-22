 #!/bin/bash

read -p " Give the name for new ssk-key ! " sshKeyName
 ssh-keygen -t ed25519 -N '' -f ~/.ssh/$sshKeyName
 eval $(ssh-agent -s)
 ssh-add ~/.ssh/$sshKeyName
  
 sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/g' /etc/ssh/sshd_config
 sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
  
 echo "| Restart du service sshd >>" 
 sudo systemctl restart sshd
 sudo systemctl status sshd | grep Active
                               
              
 read -p "| Change  User password ? >>" pass
 if [[ $pass == "yes" ]] || [[ $pass == "y" ]]
 then
   sudo passwd $pass
 elif [[ $pass == "no" ]] || [[ $pass == "n" ]]
 then
   echo " You choose to not change the USER password "
 else
    echo " You've tape the wrong key "
 fi
