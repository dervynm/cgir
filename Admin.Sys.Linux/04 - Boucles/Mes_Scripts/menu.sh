#!/bin/bash

OK=0

ERR_CODE_ADMIN=1
ERR_CODE_ARGS=2

ERR_MSG_ADMIN="Vous n'etes pas autorisez à exécuter ce script"
ERR_MSG_ARGS="1 argument nécessaire"
commande=""

if test $UID -ne 0
then
	echo $ERR_MSG_ADMIN
	exit $ERR_CODE_ADMIN
fi

if test $# -ne 2
then
	echo $ERR_MSG_ARGS
	exit $ERR_CODE_ARGS
fi

echo "Quelle action souhaitez-vous réaliser sur le fichier $2 ?"
echo "Entrez votre choix : "
select choix in "Lister" "Supprimer" "Vider" "Infos"
do
	if test $REPLY -eq 1 || test $REPLY -eq 2 || test $REPLY -eq 3 || test $REPLY -eq 4
	then
		echo "Vous avez choisi $REPLY ($choix)"
		case $REPLY in
			[1])	echo -e "La commande exécutée est : less $2"
					less $2
#					echo -e "La commande exécutée est : head -1 $1 |cut -d ' ' -f3-"
					exit $OK;;
			[2])	echo -e "La commande exécutée est : rm $2"
					rm $2
#					$commande="head -2 $1 |tail -1 |cut -d ' ' -f3-"
					exit $OK;;
			[3])	echo -e "La commande exécutée est : cp /dev/null $2"
					cp /dev/null $2
#					$commande="tail -2 $1 |head -1 |cut -d ' ' -f3-"
					exit $OK;;
			[4])	echo -e "La commande exécutée est : ls -li $2"
					ls -li $2	
#					$commande="tail -1 $1 |cut -d ' ' -f3-"
					exit $OK;;
			*)		echo "404 not found";;
		esac			
		break
	else
		echo "Mauvais choix, veuillez recommencez"
	fi
done
exit $OK
