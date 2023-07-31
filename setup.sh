#!/bin/bash

## Generate conf.d
ENV_FILE=.env
source $ENV_FILE
export $(grep --regexp ^[A-Z] $ENV_FILE | cut -d= -f1)

mkdir -p ./nginx/conf.d
envsubst "$(printf '${%s} ' $(env | cut -d'=' -f1))" < nginx/templates/default.conf.template > nginx/conf.d/default.conf

## Generate JWT
./generateJwtKeys.sh
