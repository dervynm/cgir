#!/bin/bash

################################################################################
# tirages.sh choisit aléatoirement 10 comptes parmi ceux déclarés dans passwd
################################################################################

declare -a comptes  #tableau de chaînes
while read compte   #lecture du fichier constitution du tableau
do
	compte=${compte%:*:*:*:*:*:*}   #extraction du 1er champ si conforme
	comptes[${#comptes[*]}]=$compte # ajout en fin du tableau
done </etc/passwd  #redirection d'entrée

nb_comptes=${#comptes[*]} #nombre de comptes trouvés
echo "Il y a  $nb_comptes comptes déclarés"

for ((i=0;i<10;i++)) #choisir aléatoirement 10 comptes
do
	# tirage modulo le nb de comptes
	tirage=$((RANDOM%$nb_comptes))
	 # ajout au tableau des élus	
	selectionnes[i]=${comptes[tirage]}
	# retrait du tableau de tirage (doublons)
	comptes[tirage]=${comptes[${comptes[nb_comptes]}]} 
	# mise à jour du nombre de compte
	((nb_comptes--)) 
done

#affichage du résultat
echo "Liste des comptes sélectionnés"
for i in ${!selectionnes[*]}
do
	echo $i  ${selectionnes[i]}
done
exit 0



