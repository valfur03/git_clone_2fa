#!/bin/bash

RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
YELLOW=$'\e[1;33m'
NC=$'\e[0m'

if res=$(curl --fail --request GET "https://api.valfur.fr/api/cloner/auth/?token='$1'" 2> /dev/null) > /dev/null
then
	if git clone $res 2> /dev/null > /dev/null
	then
		echo "${GREEN}Success${NC}"
	else
		if ls ${res##*/} 2> /dev/null > /dev/null
		then
			echo "${YELLOW}Repo has already been cloned${NC}"
		else
			echo "${RED}Error when cloning${NC}"
		fi
	fi
else
	echo "${RED}Invalid token${NC}"
fi
