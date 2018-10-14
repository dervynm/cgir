# Le protocole IP et ses associés

a. Fichier `capture1.pcapng`

## Quel est le protocole transporté par cette trame Ethernet et à quoi sert-il?

		Le protocole utilisé par cette trame est le protocole ARP

## Quelle est l'adresse MAC de destination utilisée par la trame numéro 1? Pourquoi?

		La trame n°1 utilise l'adresse MAC de broadcast car la machine qui
		émet la trame ne connaît pas la machine destination

## Quelle est l'adresse MAC de destination utilisée par la trame numéro 2? Pourquoi?

		L'adresse MAC destination correspond à l'adresse MAC source de la 
		trame n°1 car la route est maintenant connue

## Quelle est l'adresse IP pour laquelle cette requête à été émise?

		L'adresse IP émettrice est la suivante : 192.168.1.5

## Expliquez pourquoi ce n'est pas cette adresse IP qui est dans la requête et à quoi correspond l'adresse recherchée

		On ne retrouve pas cette sadresse destination car la machine
		201.10.10.1 ne fait pas partie du même réseau. Ainsi on retrouve donc
		dans la première trame l'adresse du routeur qui connaît le réseau
		dans lequel se trouve la machine 210.10.10.1


b. Fichier `capture2.pcapng`

## Quels sont les protocoles présents dans cette capture?

		Le protocole utilisé est le protocole ICMP

## Quelle commande a déclenché cette communication?

		ping -c1 210.10.10.129
