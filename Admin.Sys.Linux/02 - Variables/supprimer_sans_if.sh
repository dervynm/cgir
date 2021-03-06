#!/bin/bash

##################################################################################
# Le script supprimer.sh supprime le fichier dont le nom a été passé en argument #
# S'il y a plusieurs argumen,ts seul le premlier est traité                      #
##################################################################################

############################ Codes et messages d'erreurs #########################
OK=0
# Attribution des codes d'erreur 
ERR_CODE_ARGUMENT_ABSENT=1
ERR_CODE_ARGUMENT_INEXISTANT=2
ERR_CODE_ARGUMENT_NONFICHIER=3
ERR_CODE_SAISIE_REPONSE=4
ERR_CODE_FICHIER_SUPPRESSION=5
# Enregistrement des messages d'erreurs
ERR_MSG_ARGUMENT_ABSENT="Vous n'avez pas spécifié le nom du fichier à effacer"
ERR_MSG_ARGUMENT_INEXISTANT="Le chemin spécifié n'est pas dans l'arborescence"
ERR_MSG_ARGUMENT_NONFICHIER="Le chemin spécifié ne désigne pas un fichier"
ERR_MSG_SAISIE_REPONSE="La réponse saisie n'est pas correcte"
ERR_MSG_FICHIER_SUPPRESSION="Le fichier n'a pas pu être supprimé"

MSG_TROP_DARGUMENTS="Trop d'arguments seul le premier est pris en compte"
##################################################################################

############################ Contrôle des arguments ##############################
# Vérifier si au moins un argument a été passé #
test $# -eq 0 && echo $ERR_MSG_ARGUMENT_ABSENT && exit $ERR_CODE_ARGUMENT_ABSENT
# Vérifier si l'argument se trouve dans l'arborescence
test -e "$1" || echo "$1 : $ERR_MSG_ARGUMENT_INEXISTANT" && exit $ERR_CODE_ARGUMENT_INEXISTANT
# Vérifier si l'argument est un fichier
test -f "$1" || echo "$1 : $ERR_MSG_ARGUMENT_NONFICHIER" && exit $ERR_CODE_ARGUMENT_NONFICHIER
# Informer si trop d'arguments ont été fournis
test $# -gt 1 && echo $MSG_TROP_DARGUMENTS
##################################################################################


##################################################################################

# Remarque sur le comportement du rm : 
# si l'user ne possède pas le droit w sur le fichier, 
# rm demande une confirmation même si l'user à le droit w sur le répertoire 
# => pour éviter le pb spécifier l'option -f 

##################################################################################


####################### Tentative de suppression ###################################

read -p "Voulez-vous supprimer le fichier $1 (o/n) ?" reponse 
# Arrêt en cas de réponse incorrecte
	case $reponse in
						#########################################################################
		[oOyY])	#contrôler la bonne exécution de la commande
						rm -f "$1" 2>/dev/null && echo "Le fichier $1 a été supprimé" && exit $OK
					  echo "Le fichier $1 n'a pu être supprimé"
					exit $ERR_CODE_FICHIER_SUPPRESSION ;;
						#########################################################################
		[nN]) 	echo "Le fichier $1 n'a pas été supprimé"
						exit $OK ;;
						#########################################################################
		*)			echo $ERR_MSG_SAISIE_REPONSE		
						echo "Répondre par oui (oOyY) ou non (nN) svp"
						exit $ERR_CODE_SAISIE_REPONSE ;;
						#########################################################################
	esac
exit $OK

#####################################################################################

