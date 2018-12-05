#!/bin/bash

OK=0
ERR_INTROUVABLE=1
ERR_FORMAT=2

function telephone() {
	if [[ ! "$1" = 0????????? ]] # Impossible de trouver le bon format avec des espaces. 
	then 						 # Trop de complications (utilisation des \ pour protéger le caractère espace)
		echo "Erreur de format"
		return $ERR_FORMAT
	else
		numero=$(getent passwd | cut -d ':' -f5 | cut -d ',' -f3 | grep $1)
		if [[ $numero = "" ]]
		then
			return $ERR_INTROUVABLE
		else
			echo "Ce numéro existe"
			return $OK
		fi
	fi
}

# Commentaire de debug
# echo "Execution de login.sh"

telephone $1