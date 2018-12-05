#!/bin/bash

############################################################################################
# Le script choisirFichier.sh propose un menu pour choisir parmi les 5 plus gros fichiers
# du répertoire fourni en paramètre (le 0 permet d'annuler le choix)
# Ce script affiche le nom du fichier choisi et retourne un numéro de fichier entre 1 et 5 :
############################################################################################

ERR_ANNULATION=0
ERR_REPERTOIRE=6
MSG_ANNULATION=Annulation

if ! source ./argumentRepertoire.sh $*
then
	echo "Erreur de répertoire"
	exit $ERR_REPERTOIRE
fi

PS3_OLD=$PS3
PS3="Choisir un fichier parmis les cinq proposés (0 pour annuler) : "

select reponse in $(ls -1rS $1 | tail -5)
do
	case $REPLY in
		[1-5])	echo $reponse
				PS3=$PS3_OLD
				exit $REPLY;;
		0)		echo $MSG_ANNULATION
				PS3=$PS3_OLD
				exit $ERR_ANNULATION;;
		*)		:;;
	esac
done
