#!/bin/bash

CONTAINER_NAME=arlina-minio
DATE=$(date +%Y_%m_%d_%H_%M)
FILE_PATH=${1:-}

if [ -f "$FILE_PATH" ]; then
    docker cp $FILE_PATH $CONTAINER_NAME:/data/arlina-bucket.tar.gz
    docker exec -it $CONTAINER_NAME sh -c "cd /data && tar -zxvf arlina-bucket.tar.gz && rm arlina-bucket.tar.gz"
    echo "Minio data successfully imported"
else
	echo "$FILE doesn't exist."
fi
