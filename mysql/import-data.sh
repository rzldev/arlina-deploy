#!/bin/bash

FILE=$1

source .env

if [ -f "$FILE" ]; then
	docker cp $FILE mysqldb:/arlina-backup-data.sql
    docker exec -it mysqldb sh -c "mysql -u root -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /arlina-backup-data.sql"
	echo "$FILE successfully imported."
else
	echo "$FILE doesn't exist."
fi