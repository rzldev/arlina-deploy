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

source .env

docker_images=("arlinadocker/arlina-admin:$IMAGE_VERSION" "arlinadocker/arlina-user:$IMAGE_VERSION" "arlinadocker/api:$IMAGE_VERSION" "arlinadocker/auth-jwt:$IMAGE_VERSION")
docker_native_images=("arlinadocker/arlina-admin:$IMAGE_VERSION" "arlinadocker/arlina-user:$IMAGE_VERSION" "arlinadocker/api:$IMAGE_VERSION-native" "arlinadocker/auth-jwt:$IMAGE_VERSION-native")

if [ -n "$native" ]; then
    if [ "$native" != "native" ]; then
        echo "${RED}Error: The second parameter must be 'native' if it exists.${ENDCOLOR}"
        exit 1
    fi

    for image in "${docker_native_images[@]}"; do
        docker pull "$image"
    done

    docker-compose -f "docker-compose-$mode.native.yml" up -d
else 
    for image in "${docker_images[@]}"; do
        docker pull "$image"
    done

    docker-compose -f "docker-compose-$mode.yml" up -d
fi

docker exec arlina-minio sh -c "/scripts/init.sh";
