#!/bin/bash

###################################################################################
# Le script classer_noms.sh trie les ressources en paramètres en trois catégories :
# fichiers ordinaires, répertoires, autres 
# autres : tous ceux qui n'appartiennent pas aux 2 premières (liens phys, device...)                                             #          
###################################################################################
fichiers="Fichiers :"
repertoires="Répertoires :"
autres="Autres :"
if test $# -eq 0 ;then echo "Fournir au moins un nom de fichier";exit 1;fi
for ressource in $*
do
if test $(ls -l $ressource |cut -c1) = "-";then fichiers="$fichiers$ressource; ";continue;fi
if test -d $ressource ;then repertoires="$repertoires$ressource; ";continue;fi
autres="$autres;$ressource"
done
echo -e "$fichiers\n$repertoires\n$autres"
