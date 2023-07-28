#!/bin/bash

## Generate JWT
./generateJwtKeys.sh

## Run docker containers
docker-compose -f docker-compose-dev.yml up -d

## Init minio
docker exec arlina-minio sh -c "/scripts/init.sh";
