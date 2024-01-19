#!/bin/bash

source .env

DATE=$(date +%Y_%m_%d_%H_%M)
FILE=arlinadb-schema-$DATE.sql

mysqldump --host=127.0.0.1 --port=$MYSQL_PORT -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE --no-data | \
sed 's/^CREATE TABLE /CREATE TABLE IF NOT EXISTS /' | \
sed 's/^DROP TABLE IF EXISTS /-- DROP TABLE IF EXISTS /' > $FILE

echo "Mysql schema successfully exported with path $FILE"