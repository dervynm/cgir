#!/bin/bash

OK=0

ERR_CODE_NOT_A_FILE=1
ERR_CODE_ARGS=2
ERR_CODE_FILE=3

ERR_MSG_NOT_A_FILE="$1 isn't a file !"
ERR_MSG_ARGS="One argument needed ($# provided)"
ERR_MSG_FILE="The file structure is incorrect !"


if test $# -ne 1
then
	echo $ERR_MSG_ARGS
	exit $ERR_CODE_ARGS
fi

if ! test -f $1
then
	echo $ERR_MSG_NOT_A_FILE
	exit $ERR_CODE_NOT_A_FILE
fi

liste=cat $1
echo $liste

for nom in $*
do
	if getent group "$nom" &>/dev/null
	then
	  	read -p "Delete group $group ? (y/n): " answer
	   	case $answer in
	  		[OoYy])	delgroup $group
	   				echo "Group $group has been removed"
					continue;;
	   		[Nn])	echo "Group $group has not been removed"
					continue;;
			*)		echo "Type yes (YyOo) or no (Nn)"
					continue;;
	   	esac
	else
	   	echo $ERR_MSG_NOT_FOUND
		continue
    fi
    continue
done
