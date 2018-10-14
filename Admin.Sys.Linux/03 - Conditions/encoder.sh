#!/bin/bash
##############################################################################################
#         encoder.sh demande la saisie d'une chaîne puis l'affiche sous forme codée          # 
##############################################################################################
 
read -p  "Saisissez votre chaine :"
# contrôle qu'il y a uniquement des caractères alphabétiques
# (pipe puis opérateur logique) 
echo -n "$REPLY" | grep "[^a-zA-Z]" && echo "n'est pas encodable" && exit 1 

# "=>" sont des caractères à afficher il faut les protéger, sinon redirection
echo "$REPLY => " $(echo $REPLY|tr "[:upper:]" "[:lower:]"|tr "[a-y]" "[B-Z]"|tr "[z]" "[A]")

exit 0
