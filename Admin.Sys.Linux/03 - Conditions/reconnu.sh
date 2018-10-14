#!/bin/bash
############################################################################## 
#    reconnu.sh indique si l'identifiant d'utilisateur est connu du système  #
############################################################################## 

############################################################################## 
# Renseignement de $1 si l'argument n'est pas fourni sur la ligne de commandes
if test $# -eq 0
then read -p "Entrez le nom recherché:"
	set $REPLY # pour pouvoir ensuite travailler avec $1
fi
############################################################################## 


############################################################################## 
# Recherche de $1 dans /etc/passwd
if getent passwd "$1" &>/dev/null
then 
	echo -n "$1 correspond"
else 
	echo -n "$1 ne correspond pas"; 
fi
echo " à un identifiant de connexion"
############################################################################## 

exit 0
