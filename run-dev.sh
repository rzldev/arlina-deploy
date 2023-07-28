#!/bin/bash

## Generate JWT
./generateJwtKeys.sh

## Run docker containers
docker pull arlinadocker/arlina-admin:latest
docker pull arlinadocker/arlina-user:latest
docker pull arlinadocker/api:latest
docker pull arlinadocker/auth-jwt:latest
docker-compose -f docker-compose-dev.yml up -d

## Init minio
docker exec arlina-minio sh -c "/scripts/init.sh";
