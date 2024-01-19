#!/bin/bash

docker exec arlina-minio sh -c "/scripts/init.sh";
docker exec -it arlina-admin sh -c "./generate-env.sh"
docker exec -it arlina-user sh -c "./generate-env.sh"
