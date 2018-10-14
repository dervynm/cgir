#!/bin/bash
##############################################################################################
# Le script melange.sh classe aléatoirement les 3 chaines qui lui sont fournies en argument #
#                    (équivalent de la commande shuf du bash)                                #
##############################################################################################

# Rappel: RANDOM génère un entier entre 0 et 32767
# Détermination des bornes
TIERS_1=10923 # Compris entre 0 et 10923 exclus
TIERS_2=21846 # Compris entre 10923 et 21846 exclus

ERR_ARGUMENTS=1 # Mauvais nombre d'arguments
OK=0

##############################################################################################
if test $# -ne 3
then 
	echo "Fournir 3 noms à classer"
	exit $ERR_ARGUMENTS
fi
##############################################################################################

##############################################################################################
# Détermination du premier argument affiché
# Rappel: RANDOM génère un entier entre 0 et 32767
valeur=$RANDOM
if test $valeur -lt $TIERS_1  # si tirage dans 1er tiers => le premier argument est affiché
then 
	echo -n $1
	shift # on décale, retire $1
else 
	if test $valeur -lt $TIERS_2 # si tirage dans 2eme tiers => le deuxième argument est affiché
  then 
		echo -n $2
		set $1 $3 # on retire $2
  else  
		echo -n $3 # => le troisième argument est affiché
fi
##############################################################################################

##############################################################################################
# on classe les deux arguments restants
valeur=$RANDOM
if test $valeur -lt $TIERS_2
then 
	echo " $1 $2"
else 
	echo " $2 $1"
fi 
##############################################################################################

exit $OK

