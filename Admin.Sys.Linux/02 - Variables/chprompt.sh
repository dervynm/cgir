#!/bin/bash

################################################################################
#     Le script chprompt.sh qui modifie l'invite pour les prochains bash       #
################################################################################

################################################################################
# suppression de la modification du PS1 si elle est en dernière ligne
# recherche le n° de ligne de la première modification de PS1
grep -n "^PS1=" ~/.bashrc|cut -d":" -f1>numero

# compte le nombre de lignes du fichier .bashrc
wc -l ~/.bashrc | cut -d" " -f1>taille

# si la modification est sur la dernière ligne
if diff numero taille 
then
	echo "suppression de la dernière ligne"	
	# utilisation d'un fichier temporaire
	head -n -1 ~/.bashrc>tmp 
	# suppression du fichier temporaire
	mv tmp ~/.bashrc
else
	echo "pas de suppression de la dernière ligne"		
fi
# suppression des fichiers temporaires
rm numero taille
################################################################################

################################################################################
# Modification de l'invite et persistance par ajout dans le fichier .bashrc
################################################################################

# Remarque : nécessité d'encadrer la séquence d'échappement couleurs par des []
echo 'PS1="\[\e[1;31m\]\D{%d/%m}|\u@\h|\w|\s-\D{%Hh%M}>>\[\e[0m\]"'>>~/.bashrc

exit 0
