#!/bin/bash

OK=0

ERR_CODE_INEXISTANT=1
ERR_CODE_NO_REP=2

ERR_MSG_INEXISTANT="$1 n'existe pas"
ERR_MSG_NO_REP="$1 n'est pas un répertoire"

MSG_OK="Fichier $1 renommé $?"

NB_ARGS=$#

if [ ! $(ls $1) ]
then
	echo $ERR_MSG_INEXISTANT
	exit $ERR_CODE_INEXISTANT
fi

if [ $NB_ARGS -gt 1 ]
then
	for rep in $*
	do
		if [ ! -d $rep ]
		then
			echo $ERR_MSG_NO_REP
		fi
	done
fi

# NB_FICHIER=$(ls -l | grep "^⁻" | wc | tr -s ' ' | cut -d ' ' -f2)
NOM_FICHIER=$(ls -l | grep "^-" | tr -s ' ' | cut -d '' -f9)

for rep in $*
do
