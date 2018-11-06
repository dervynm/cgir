#!/bin/bash

###################################################################################
# script qui propose un menu permettant de choisir entre les droits suivants : 
# rwx,rw-, r-x, -wx, r--,-w- (intitulés des choix) pour changer les droits d'accès 
# des fichiers dont les noms sont dans un fichier fourni comme argument
###################################################################################

if ! cat $1 &>/dev/null
then
echo "Vous devez fournir un fichier contenant des noms de fichiers"
exit 1
fi

for fichier in $(cat $1)
do
if ! test -O $fichier
then
echo "Vous n'êtes pas propriétaire de $fichier"
continue
fi
for u in u g o 
do
PS3="Nouveaux droits $u pour le fichier $fichier:"
select droits in "rwx" "rw-" "r-x" "-wx" "r--" "-w-"
do 
case $REPLY in
1) chmod "$u=rwx" "$fichier";break;;
2) chmod "$u=rw-" "$fichier";break;;
1) chmod "$u=r-x" "$fichier";break;;
2) chmod "$u=-wx" "$fichier";break;;
1) chmod "$u=r--" "$fichier";break;;
2) chmod "$u=-w-" "$fichier";break;;
*) echo "Choix non valide";;
esac
done
done
done
exit 0
