#!/bin/bash

## Run docker containers
docker-compose -f docker-compose-prod.yml up -d

## Init minio
docker exec arlina-minio sh -c "/scripts/init.sh";
