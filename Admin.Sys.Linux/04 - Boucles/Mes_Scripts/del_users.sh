#!/bin/bash

OK=0

ERR_CODE_NOT_ADMIN=1
ERR_CODE_ARGS=2
ERR_CODE_USER_NOT_FOUND=3

ERR_MSG_NOT_ADMIN="You can't execute that script !"
ERR_MSG_ARGS="One argument needed !"
ERR_MSG_USER_NOT_FOUND="User not found..."

admin=whoami

if test $admin = "root"
then
	echo $ERR_MSG_NOT_ADMIN
	exit $ERR_CODE_NOT_ADMIN
else
  for user in $*
  do
    if getent passwd "$user" &>/dev/null
    then
    	read -p "Delete user $user ? (y/n): " answer
    	case $answer in
    		[OoYy])	deluser --remove-home "$user"
    				echo "User $user has been removed"
					continue;;
    		[Nn])	echo "User $user has not been removed"
					continue;;
    		*)		echo "Type yes (YyOo) or no (Nn)"
					continue;;
    	esac
    else
    	echo $ERR_MSG_USER_NOT_FOUND
		continue
    fi
    continue
  done
fi
