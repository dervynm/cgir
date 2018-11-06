#!/bin/bash

# Controle TP 2018 - Dervyn Mathias

OK=0

ERR_CODE_FORMAT=1
# ERR_CODE_UID=2
ERR_CODE_INEXISTANT=3
ERR_CODE_UID_INEXISTANT=4
ERR_CODE_ARGS=5

ERR_MSG_FORMAT="La chaine fournie n'est pas au format d'un identifiant utilisateur"
# ERR_MSG_UID="Le nombre fourni ne peut pas être un UID"
ERR_MSG_INEXISTANT="L'identifiant fourni n'est pas déclaré"
ERR_MSG_UID_INEXISTANT="L'UID fourni n'est pas attribué"
ERR_MSG_ARGS="Un seul paramètre nécessaire"

for user in $*
do
	# Test pour vérifier qu'il n'y a qu'un seul argument fourni (première version)
	# if [ $# -ne 1 ]
	# then
	# 	echo ERR_MSG_ARGS
	# 	exit ERR_CODE_ARGS
	# fi

	if [ $(getent passwd $user | cut -d ':' -f6) != "/home/$user" ]
	then
		echo $ERR_MSG_INEXISTANT
		continue
		# exit $ERR_CODE_INEXISTANT #fin du script si inexistant (première version)
	fi

	# Quelques difficultés pour vérifier que l'on passe bien un nom OU un UID en paramètre
	# Je voudrais vérifier que l'argument continent uniquement des caractères alphanumériques ou uniquement des chiffres
	# L'idée est là mais pas la commande...

	# if [[ $user != aA-zZ || $user -ne 0-9 ]] 
	# then
	# 	echo ERR_MSG_FORMAT
	# 	exit ERR_CODE_FORMAT
	# fi

	GROUPE=$(getent passwd $user | cut -d ':' -f4) # Variable pour récupérer le GID du groupe principal de $user

	echo "Souhaitez-vous :"
	select choix in "Lister les groupes auxquels appartient $user ?" "Lister les utilisateurs du groupe de connexion de $user ?" "Quitter"
	do
		echo "Vous avez choisi $REPLY ($choix)"
		case $REPLY in

			# Lister les groupes auxquels $user appartient (fonctionne à moitié)
			[1])	echo "Voici les groupes auxquels appartient $user"
					# Ne fonctionne pas avec des UIDs
					groups $user
					break;;
					#exit $OK;;
			# Lister les autres utilisateurs du même groupe de connexion (fonctionne)
			[2])	echo "Voici les utilisateurs ayant le même groupe de connexion que $user"
					echo $(grep $GROUPE /etc/group | cut -d ':' -f4-)
					break;;
					#exit $OK;;
			# Quitter
			[3])	exit $OK;;
			# Erreur sur la sélection
			*)		echo "Choix inexistant"
					continue;;
		esac			
		break
	done
done
exit $OK