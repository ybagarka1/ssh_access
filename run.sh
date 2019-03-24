#!/bin/bash
action=$1
user_name=$2
export PDSH_RCMD_TYPE=ssh
export WCOLL=hosts
grant_access()
{
        echo "grant"
        export user_value=$1
	pdsh sudo useradd $user_value -p '"$(openssl passwd -1 password1234)"' 
	pdsh sudo chage -d 0 $user_value 
	echo "pdsh 'sudo useradd $user_value -p "$(openssl passwd -1 password1234)"'"
}

revoke_access()
{
        echo "revoke"
	user_value=$1
        echo "pdsh sudo userdel $user_value"
	pdsh sudo userdel $user_value
}

if [[ $action == "grant" ]]
then
        grant_access "$user_name"
elif [[ $action == "revoke" ]]
then
        revoke_access "$user_name"
fi

