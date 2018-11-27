# Autoconfiguration minimale

## Adresse MAC PC1 ?

		92:02:cd:f5:67:92

## Vérifier que l'adresse de lien local correspond bien à vos attentes.

		On a bien une adresse commençant par fe80

## Observez l'évolution de l'adresse de lien local sur le terminal.

		Passage de "link tentative" à "link"

## Quels sont les messages dans wireshark, et à quoi correspondent-ils ?

		On peut voir des trames ICMPv6 qui correspondent aux requêtes de sollicitation
		du routeur.

## Quelle est l'adresse de destination du message de "sollicitation du voisin"

		ff02::1:ffe5:a27f
		Cette adresse correspond à "l'adresse multicast sollicitée".
		Elle est contituée comme suit:
		ff02::1:<24 derniers bits IPv6>

# Autoconfiguration avec routeur

## Que constatez vous par rapport au lab précédent ?

		Cette fois-ci, on obtient d'abord "link tentative", puis "global tentative dynamic" et enfin "global dynamic"

## Par rapport à la capture du lab précédent, quel message supplémentaire avez vous capturé ?

		On obtient un second message de sollicitation du voisin

## Quelles informations apporte-t'il à pc2 ?

		Les informations concernant le routeur

# Renumérotation du réseau

## Observez la durée de vie du préfixe global

		La durée de vie du préfixe global est de 2591532 secondes.

##