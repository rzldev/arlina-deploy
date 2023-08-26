#!/bin/bash

source .env

mysql --host=127.0.0.1 --port=$MYSQL_PORT -u $MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
