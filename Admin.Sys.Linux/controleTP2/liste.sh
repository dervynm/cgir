#!/bin/bash

# Ne fonctionnera pas --> extrait.sed incomplet

OK=0

numeros=$(extrait.sed $1)
source ./logins.sh $numeros

exit $OK