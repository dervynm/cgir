#!/bin/bash

############################################################################################
# Le script choisirFichier.sh propose un menu pour choisir parmi les 5 plus gros fichiers
# du répertoire fourni en paramètre (le 0 permet d'annuler le choix)
# Ce script affiche le nom du fichier choisi et retourne un numéro de fichier entre 1 et 5 :
############################################################################################
ERR_ANNULATION=0
ERR_REPERTOIRE=6
MSG_ANNULATION="Annulation"

# Vérifier si un argument unique a été passé
if ! source ./argumentRepertoire.sh $*
then 
	exit $ERR_REPERTOIRE # erreur si l'argument n'est pas un répertoire
fi

PS3_OLD=$PS3 # sauvegarde le prompt de niveau 3 utilisé par select
PS3="Choisir un fichier parmi les 5 proposés (0 pour Annuler):" # redéfinit le prompt du select
# propose le choix parmi les 5 plus gros fichiers
select reponse in $(ls -1rS $1|tail -5)  # liste les fichiers, 1 par ligne, triés, conserve les 5 1er
do
	case $REPLY in 
		[1-5]) 	echo $reponse; # affiche la réponse choisie (pour récupération par le script appelant)
				PS3=$PS3_OLD;  # remet en état le prompt de niveau 3
				exit $REPLY;;	# retourne le chiffre choisi correspondant au fichier(pour gestion d'erreur) 
		0) 		echo $MSG_ANNULATION; # n'est pas utilisé dans le TP
				PS3=$PS3_OLD ;   # remet en état le prompt de niveau 3
				exit $ERR_ANNULATION;; # exécution correcte mais avortée
		*):;;  # : opération vide , quand la saisie n'est pas correcte on boucle
 	esac
done
