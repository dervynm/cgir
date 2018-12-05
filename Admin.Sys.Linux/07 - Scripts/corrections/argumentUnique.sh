#!/bin/bash

##########################################################################
# Le script argumentUnique.sh : script utilisé par un autre script pour
# savoir s'il a bien été appelé en lui passant un seul argument
##########################################################################

### Codes erreurs ####
OK=0
ERR_ARGUMENT_ABSENT=1
ERR_ARGUMENTS_EN_TROP=2
ERR_ARGUMENT_INEXISTANT=3

# Vérifier si un argument a été passé
if [[ $# -eq 0 ]] 
then
	echo "Vous n'avez pas spécifié de nom"
	return $ERR_ARGUMENT_ABSENT
fi

# Tester si un seul argument
if [[ $# -gt 1 ]]
then
	echo -e "Vous avez donné plus d'un argument"
	return $ERR_ARGUMENTS_EN_TROP
fi

# Vérifier si le nom existe
if [[ ! -e "$1" ]]
then
	echo "$1 n'a pas été trouvé"
	return $ERR_ARGUMENT_INEXISTANT
fi
return $OK
