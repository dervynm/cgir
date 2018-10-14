#!/bin/bash

OK=0

ERR_CODE_NOT_ADMIN=1
ERR_CODE_TOO_MANY=2
ERR_CODE_USER_NOT_FOUND=3

ERR_MSG_NOT_ADMIN="You can't execute that script !"
ERR_MSG_TOO_MANY="Too many arguments...1 needed !"
ERR_MSG-USER_NOT_FOUND="User not found..."

if test $# -ne 1
then
	echo $ERR_MSG_TOO_MANY
	exit $ERR_CODE_TOO_MANY
fi

admin=who |cut -d ' ' -f1

if test $admin -ne "root"
then
	echo $ERR_MSG_NOT_ADMIN
	exit $ERR_CODE_NOT_ADMIN
else
	if getent passwd "$1" &>/dev/null
	then
		read -p "Delete user $1 ? (y/n): " answer
		case $answer in
			[OoYy])	deluser --remove-home "$1"
				echo "User $1 has been removed"
				exit $OK;;
			[Nn])	echo "User $1 has not been removed";;
			*)	echo "Type yes (YyOo) or no (Nn)";;
		esac
	else
		echo $ERR_MSG_USER_NOT_FOUND
		exit $ERR_CODE_USER_NOT_FOUND
	fi
fi
