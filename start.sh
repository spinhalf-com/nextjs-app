#!/bin/bash

docker-compose down --remove-orphans

if [[ $1 = '-D' ]] || [[ $2 = '-D' ]] || [[ $3 = '-D' ]]
then
  rm -rf ./db_data/*
fi

if [[ $1 = '-R' ]] || [[ $2 = '-R' ]] || [[ $3 = '-R' ]]
then
  yes | docker system prune
  yes | docker network prune
  yes | docker volume prune
fi
docker-compose up -d --build

if [[ $1 = '-C' ]] || [[ $2 = '-C' ]] || [[ $3 = '-C' ]]
then
  rm -rf node_modules
  docker cp next:app/node_modules/ ./node_modules
fi


