#!/bin/bash 

################################################################################
# Le script moyenne.sh calcule des moyennes sur un fichier csv fourni
# ajout en fin de ligne de la moyenne de la ligne
# ajout en bas de colonnes de la moyenne de la colonne
################################################################################

if [ $# -lt 1 ] 
then 
    echo "Saisir le nom du fichier" 
    read fichier 
else 
    fichier=$1 
fi 

# fonction de controle de validite du fichier fourni
# a ecrire

read ligne<$fichier
set ${ligne//";"/" "}
((nb_champs=$#-1))
# pb de fin de ligne
echo $nb_champs champs
nb_lignes=0
while read ligne 
do 
	if test $nb_lignes -eq 0 ;then read ligne;fi
	set ${ligne//;/ }

	shift
	#echo "$*"
	total=0
	for ((i=0;i<4;i++))
	do
valeur=$1
valeur=${valeur%[^0-9]*}
#echo "-$valeur-"
if test "x${valeur}x" = "xx" ;then break;fi
		((total=valeur+total))
		shift
	done
echo total $total
	((moyenne=total/nb_champs))
exit
	echo " $ligne $moyenne" 
done < $fichier
