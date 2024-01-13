#!/bin/bash

docker exec arlina-minio sh -c "/scripts/init.sh";

docker cp .env.frontend arlina-admin:./.env
docker exec -it arlina-admin sh -c "./generate-env.sh"

docker cp .env.frontend arlina-user:./.env
docker exec -it arlina-user sh -c "./generate-env.sh"
