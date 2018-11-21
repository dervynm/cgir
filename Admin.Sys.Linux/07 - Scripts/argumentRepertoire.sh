#!/bin/bash

##########################################################################
# argumentRepertoire.sh : script utilisé par un autre script pour savoir #
# s'il a bien été appelé en lui passant un unique répertoire lisible     #
##########################################################################

OK=0
ERR_ARGUMENT_NON_REPERTOIRE=4
ERR_REPERTOIRE_NON_LISIBLE=5
ERR_REPERTOIRE_VIDE=6

# Vérifier si un argument unique a été passé
if ! source ./argumentUnique.sh $*
then 
	return $?
fi

# Vérifier qu'il s'agit d'un répertoire

if [[ ! -d "$1" ]]
then
	echo "$1 n'est pas un répertoire"
	return $ERR_ARGUMENT_NON_REPERTOIRE
fi

# Vérifier que le répertoire est accessible

if [[ ! -x "$1" || ! -r "$1" ]]
then	
	echo "$1 n'est pas lisible"
	return $ERR_REPERTOIRE_NON_LISIBLE
fi

if [[ -z "$1" ]]
then
	echo "$1 est vide"
	return $ERR_REPERTOIRE_VIDE
fi

return $OK