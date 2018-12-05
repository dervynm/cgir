#!/bin/bash

# argumentUnique.sh : script utilisé par un autre script pour savoir
# s'il a bien été appelé en lui passant un seul argument

OK=0
ERR_ARGUMENT_ABSENT=1
ERR_ARGUMENTS_EN_TROP=2
ERR_ARGUMENT_INEXISTANT=3

if [ $# -e 0 ]
then
	echo "1 argument necessaire"
	return $ERR_ARGUMENT_ABSENT
fi

if [ $# -gt 1 ]
then
	echo "1 seul argument necessaire"
	return $ERR_ARGUMENTS_EN_TROP
fi

if [ ! -e "$1" ]
then
	echo "$1 introuvable"
	return $ERR_ARGUMENT_INEXISTANT
fi

return $OK