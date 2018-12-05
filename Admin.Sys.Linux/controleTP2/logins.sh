#!/bin/bash

# Les commentaires présents dans le code m'ont permis de débuguer.

OK=0

for numero in $*
do
	# echo $numero
	./login.sh $numero
	# echo $?
	# echo

	if [[ $? -eq 0 ]]
	then
		# echo "Existe"
		nom=$(getent passwd | grep $numero | cut -d ':' -f1)
		echo "$nom : $numero"
		echo
	else
		continue
	fi
done

return $OK