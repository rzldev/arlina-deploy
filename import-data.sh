#!/bin/bash

FILE=$1

source .env

if [ -f "$FILE" ]; then
	docker cp $FILE mysqldb:/
	docker exec -it mysqldb sh -c "mysql -u $MYSQL_ROOT -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < $FILE"
	echo "$FILE successfully imported."
else
	echo "$FILE doesn't exist."
fi