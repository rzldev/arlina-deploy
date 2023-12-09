#!/bin/bash

## Run docker containers
docker pull arlinadocker/arlina-admin:latest
docker pull arlinadocker/arlina-user:latest
docker pull arlinadocker/api:latest-native
docker pull arlinadocker/auth-jwt:latest-native
docker-compose -f docker-compose-dev.yml up -d

## Init minio
docker exec arlina-minio sh -c "/scripts/init.sh";
