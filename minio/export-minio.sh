#!/bin/bash

CONTAINER_NAME=arlina-minio
DATE=$(date +%Y_%m_%d_%H_%M)
FILE=./arlina-bucket-$DATE.tar.gz

docker exec -it $CONTAINER_NAME sh -c "cd /data && tar -zxvf arlina-bucket.tar.gz arlina-bucket"
docker cp $CONTAINER_NAME:/data/arlina-bucket.tar.gz $FILE
echo "Minio data successfully exported with path $FILE"
