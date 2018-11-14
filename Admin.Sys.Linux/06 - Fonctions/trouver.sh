#!/bin/bash

# Script trouver.sh ------------------------------------------------------------
# Script permettant de trouver une chaine de caractère dans des fichiers passés
# en paramètres ----------------------------------------------------------------

# Code de retour ---------------------------------------------------------------
OK=0

# Codes de retour et messages d'erreur -----------------------------------------
ERR_CODE_ABS=1
ERR_MSG_ABS="Fichier introuvable"

ERR_CODE_READ=2
ERR_MSG_READ="Impossible de lire le fichier"

ERR_CODE_ARGS=3
ERR_MSG_ARGS="Au moins 2 parametres sont necessaires"

ERR_CODE_NOT_FOUND=4
ERR_MSG_NOT_FOUND="Chaine introuvable"

# Fonction 'present()' ---------------------------------------------------------
# Détermine si une chaine de caractère est présente ou non dans un fichier -----
# return 0 si $1 existe dans le fichier $2 -------------------------------------
# return 1 sinon ---------------------------------------------------------------
function present() {
	cat $2 &>/dev/null && return $(grep -q "$1" "$2"); return 2
}

# Test du nombre d'arguments ---------------------------------------------------
if [ $# -lt 2 ]
then
	echo $ERR_MSG_ARGS
	exit $ERR_CODE_ARGS
fi

CHAINE=$1
shift

EXISTE=false

# Boucle for pour vérifier dans tous les fichiers ------------------------------
for FICHIER in $*
do
	if present "$CHAINE" $FICHIER
	then
		echo "Fichier testé : $FICHIER"
		EXISTE=true
		echo "La chaine $CHAINE est présente dans le fichier $FICHIER"
		continue
	elif [ $? == 2 ]
	then
		echo $ERR_MSG_READ $FICHIER
		echo "Arrêt du script..."
		exit $ERR_CODE_READ
	else
		echo $ERR_MSG_NOT_FOUND "dans le fichier" $FICHIER
	fi
done

exit $OK