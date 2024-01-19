#!/bin/bash

docker exec arlina-minio sh -c "/scripts/init.sh";

docker exec arlina-admin sh -c "cp /.env ./.env"
docker exec -it arlina-admin sh -c "./generate-env.sh"
docker exec arlina-admin sh -c "cp /.env ./.env"
docker exec -it arlina-user sh -c "./generate-env.sh"
