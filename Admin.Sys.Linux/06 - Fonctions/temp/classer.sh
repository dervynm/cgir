#!/bin/bash

# Script classer.sh ------------------------------------------------------------
# Script qui classe les fichiers selon leur extension pour un répertoire donné
# en paramètre -----------------------------------------------------------------

# Code de retour
OK=0

# Codes de retour et messages d'erreur -----------------------------------------
ERR_CODE_ARGS=1
ERR_MSG_ARGS="$1 n'est pas un répertoire"

ERR_CODE_NOT_CREATED=2
ERR_MSG_NOT_CREATED="L'un des répertoires n'a pas été créé correctement"

ERR_CODE_NOT_MOVED=3
ERR_MSG_NOT_MOVED="Un fichier n'a pas été déplacé"

# Fonction 'initialiser()' : Créée les sous-répertoires ------------------------
function initialiser() {
	return $(mkdir "textes" "scripts" "datas" &>/dev/null)
}

# Fonction 'classer()' : Classe les fichiers en fonction de leurs extensions ---
function classer() {
	for FICHIER in $(ls -F | egrep -v "/$")
	do
		
}

initialiser $1