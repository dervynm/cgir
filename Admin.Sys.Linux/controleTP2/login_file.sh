#!/bin/bash

OK=0

numeros=$(cat "$1")
source ./logins.sh $numeros

exit $OK

# L'affichage des personnes avec leurs numéros est déjà géré par "logins.sh"