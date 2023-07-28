#!/bin/bash

chmod 700 /scripts
chmod 744 /opt/bin/mc
mc alias set arlina-minio http://localhost:9000 $MINIO_ROOT_USER $MINIO_ROOT_PASSWORD
mc mb arlina-minio/arlina-bucket
mc anonymous set download arlina-minio/arlina-bucket
