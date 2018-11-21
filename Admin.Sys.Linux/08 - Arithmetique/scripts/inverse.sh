#!/bin/bash

OK=0

function inverse {
	nbcar=$(expr length $1)
	# nbcar=${#1}

	while((nbcar>=0))
	do
		echo -n $(expr substr "$1" "$nbcar" 1)
		((nbcar--))
	done
}

# Inverse un seul mot
if [[ $# = 1 ]]
then
	inverse $1
fi

# Inverse plusieurs mots
if [[ $# -gt 1 ]]
then
	for mot in $*
	do
		inverse $mot
	done
	echo
fi

exit $OK