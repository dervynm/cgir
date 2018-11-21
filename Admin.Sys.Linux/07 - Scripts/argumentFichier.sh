#!/bin/bash

#######################################################################
# argumentFichier.sh : script utilisé par un autre script pour savoir #
# s'il a bien été appelé en lui passant un unique fichier lisible     #
#######################################################################

OK=0
ERR_ARGUMENT_NON_FICHIER=4
ERR_FICHIER_NON_LISIBLE=5

if source ./argumentUnique.sh $*
then
	return $?
fi

# Vérifier qu'il s'agit d'un fichier

if [ ! -f "$1" ]
then
	echo "$1 n'est pas un fichier"
	return $ERR_ARGUMENT_NON_FICHIER
fi

# Vérifier que le fichier est lisible

if ! cat "$1" &>/dev/null
then
	echo "$1 n'est pas lisible"
	return $ERR_FICHIER_NON_LISIBLE
fi

return $OK