# ssh_access

# path: shell folder

The repo is for providing new users access to the linux server. The below points are assumed/pre-requsite for granting access/

Pre-requsite:
1. While executing the script the current user has password less access to the target server
2. Has sudo access to execute the admin commands.


Usage:

./run.sh grant <username> --> to grant access to the user_name.
  
./run.sh grant <username> --> to revoke access of the user with user_name.
  
Server info:
I am using pdsh commad to execute across all the hosts. The hosts IP is defined in the a file named 'hosts'. For new server addition the file needs to be updated with the IP only.
  
  Note:- the user would be created with default password 'password1234'. After successfull login there would be a prompt to change the password i.e the user needs to set the password.
  
# path: ansible
  
  Written an ansible playbook to implemnt the same functionality. The password for every user is set to password1234. The password change prompt will be there for all such users.
  
Usage:
  
  username=<username>
  
  ansible-playbook ssh_access.yml -i inventory --extra-vars "username=$username revoke=false" --> to create a user
  
  ansible-playbook ssh_access.yml -i inventory --extra-vars "username=$username revoke=true" --> to delete the user
