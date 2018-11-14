#!/bin/bash

##########################################################################
# Le script argumentFichier.sh : script utilisé par un autre script pour
# savoir s'il a bien été appelé en lui passant un fichier lisible
# OK=0
# ERR_ARGUMENT_ABSENT=1
# ERR_ARGUMENTS_EN_TROP=2
# ERR_ARGUMENT_INEXISTANT=3
##########################################################################

### Codes erreurs ####
OK=0
ERR_ARGUMENT_NON_FICHIER=4
ERR_FICHIER_NON_LISIBLE=5

# Vérifier si un argument unique a été passé
if source ./argumentUnique.sh $*
then 
return $? # transmet le code d'erreur retourné par argumentUnique.sh
fi

# Vérifier qu'il s'agit d'un fichier
if [[ ! -f "$1" ]]
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
