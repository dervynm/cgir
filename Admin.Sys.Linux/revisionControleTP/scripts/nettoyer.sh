#!/bin/bash

###############################################################################
# Le script nettoyer.sh propose de supprimer un des 5 fichiers les  plus gros 
# du répertoire fourni en paramètre
###############################################################################

OK=0
ERR_ARGUMENT_ABSENT=1
ERR_ARGUMENTS_ENTROP=2
ERR_ARGUMENT_INEXISTANT=3
ERR_ARGUMENT_MAUVAIS_TYPE=4
ERR_ARGUMENT_NON_LISIBLE=5
ERR_FICHIER_SUPPRESSION=6
ERR_SAISIE_REPONSE=7

function supprimer() {
	if source ./argumentFichier.sh $*
	then
		while read -p "Voulez-vous supprimer le fichier $1 (o/n) ?"
		do
			case $reponse in
				[oOyY])	if rm -f $1 2>/dev/null
						then
							echo "$1 a bien été supprimé"
							exit $OK
						else
							echo "$1 n'a pas pu être supprimé"
							exit $ERR_FICHIER_SUPPRESSION
						fi;;
				[nN])	echo "$1 n'a pas été supprimé"
						exit $OK;;
				*)		echo "Répondre par oui (oOyY) ou non (nN)";;
			esac
		done
	else
		return $?
	fi
}

if ! source ./argumentFichier.sh $*
then
	exit $?
fi

fichier=$(./choisirFichier.sh $*)
numero=$?

if [[ $numero -eq 0 ]]
then
	exit $OK
else
	supprimer $1/$fichier
	exit $?
fi
