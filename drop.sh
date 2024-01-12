#!/bin/bash

RED='\033[0;31m'
GREEN="\033[0;32m"
ENDCOLOR="\033[0;0m"

mode="$1"
native="$2"

if [ "$mode" != "dev" ] && [ "$mode" != "prod" ]; then
	echo -e "${RED}Usage: $0 <mode> <native> ${ENDCOLOR}"
    echo -e "${GREEN}E.g $0 dev|prod ${ENDCOLOR}"
    echo -e "${GREEN}E.g $0 dev|prod native ${ENDCOLOR}"
    exit 1
fi

if [ -n "$native" ]; then
    docker-compose -f "docker-compose-$mode.native.yml" down
else 
    docker-compose -f "docker-compose-$mode.yml" down
fi
