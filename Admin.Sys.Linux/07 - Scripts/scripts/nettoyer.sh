#!/bin/bash

###############################################################################
# Le script nettoyer.sh propose de supprimer un des 5 fichiers les  plus gros 
# du répertoire fourni en paramètre
###############################################################################

### Codes erreurs ####
OK=0
ERR_ARGUMENT_ABSENT=1
ERR_ARGUMENTS_ENTROP=2
ERR_ARGUMENT_INEXISTANT=3
ERR_ARGUMENT_MAUVAIS_TYPE=4
ERR_ARGUMENT_NON_LISIBLE=5
ERR_FICHIER_SUPPRESSION=6
ERR_SAISIE_REPONSE=7


function supprimer() {
	# Vérifie que l'argument fourni est bien un fichier (répertoire)
	if source ./argumentFichier.sh $*
	then
		while read -p "Voulez-vous supprimer le fichier $1 (o/n) ?" reponse 
		do
			case $reponse in
				[oOyY])	if rm -f $1 2>/dev/null 
						then 

							echo "Le fichier $1 a été supprimé"
							exit $OK
						else
							echo "Le fichier $1 n'a pu être supprimé"
							exit $ERR_FICHIER_SUPPRESSION
						fi;;
				[nN]) 	echo "Le fichier $1 n'a pas été supprimé"
						exit $OK ;;
				*)		echo "Répondre par oui (oOyY) ou non (nN) svp" ;;
			esac
		done
	else 
		return $? # transmet le code d'erreur retourné par argumentFicher.sh
	fi
}

# Vérifie que l'argument fourni est bien un répertoire
if ! source argumentRepertoire.sh $* # les arguments fournis en ligne de commande sont transmis
then 
	exit $? # Récupère le code d'erreur du script appelé et le réutilise pour le script courant
fi

fichier=$(./choisirFichier.sh $*) # récupére l'affichage de la commande, ici la reponse choisie
numero=$? # recupère le chiffre retourné , choix ou erreur
if [[ $numero -eq 0 ]] # au cas ou l'utilisateur a annulé
then 
	exit $OK
fi
supprimer $1/$fichier # appel de la fonction supprimer() supprime le fichier du répertoire
exit $?