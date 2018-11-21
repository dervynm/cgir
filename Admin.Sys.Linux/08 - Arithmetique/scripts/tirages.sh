#!/bin/bash

OK=0

# Création d'un tableau ------------------------------------------------------------------------------------------------
declare -a comptes

# Lecture du fichier /etc/passwd ---------------------------------------------------------------------------------------
while read utilisateur
do
	utilisateur=${utilisateur%:*:*:*:*:*:*} 			# Récupération du nom uniquement
	comptes[${#comptes[*]}]=$utilisateur 				# Ajout dans le table 'comptes'
done </etc/passwd

# Récupération du nombre de comptes ------------------------------------------------------------------------------------
nbComptes=${#comptes[*]}
echo "Il y a $nbComptes comptes"

# Tirage au sort -------------------------------------------------------------------------------------------------------
for((i=0;i<10;i++))
do
	tirage=$((RANDOM%nbComptes)) 						# Nombre aléatoire compris entre 0 et nbComptes
	selection[i]=${comptes[tirage]} 					# Ajout de la personne tirée au sort
	comptes[tirage]=${comptes[nbComptes]}				# Evite les doublons (ou pas)
	((nbComptes--))
done

# Affichage des sélectionnés -------------------------------------------------------------------------------------------
for i in ${!selection[*]}
do
	echo $i ${selection[i]}
done

exit $OK