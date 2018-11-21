#!/bin/bash
###############################################################################
# Le script inverse.sh inverse l'ordre des caractères 
# de la chaîne passée en paramètre
###############################################################################
OK=0
function inverse {
#initialisation de nbcar, nombre de caractères
#nbcar=$(expr length "$1")   
nbcar=${#1}

# boucler jusqu'au dernier caractère
#while [ $nbcar -ge 1 ]
while ((nbcar>=0))
do
 # affichage du nbcar ième caractère à la variable de sortie
 #echo -n "$(expr substr "$1" $nbcar 1)"
 echo -n "${1:nbcar:1}"

 # décrementer nbcar
 #nbcar=$(expr $nbcar - 1)
 ((nbcar--))
done

# variantes courte
#while ((nbcar>=0));do echo -n "${1:((nbcar--)):1}";done
#for((nbcar=${#1};nbcar>=0;nbcar--));do echo -n "${1:nbcar:1}"
}

#inversion globale
echo "$* => "$(inverse "$*")

#inversion mot à mot
echo -n "$* => "
for m in $*
do
	echo -n $(inverse "$m")" "
done
echo
exit $OK
