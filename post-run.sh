#!/bin/bash

docker exec arlina-minio sh -c "/scripts/init.sh";

docker exec arlina-admin sh -c "cp /.env usr/share/nginx/html/arlina-admin/.env"
docker exec -it arlina-admin sh -c "./generate-env.sh"
docker exec arlina-admin sh -c "cp /.env usr/share/nginx/html/arlina-user/.env"
docker exec -it arlina-user sh -c "./generate-env.sh"
