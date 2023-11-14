#!/bin/bash

source .env
mkdir -p mysql

DATE=$(date +%Y_%m_%d_%H_%M)
FILE=mysql/arlinadb-data-$DATE.sql

mysqldump --host=127.0.0.1 --port=$MYSQL_PORT -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE | \
sed 's/^CREATE TABLE /CREATE TABLE IF NOT EXISTS /' | \
sed 's/^DROP TABLE IF EXISTS /-- DROP TABLE IF EXISTS /' > $FILE
