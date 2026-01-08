#!/bin/bash

docker-compose down --remove-orphans
if [[ $1 = '-R' ]] || [[ $2 = '-R' ]] || [[ $3 = '-R' ]]
then
  rm -rf ./db_data/*
  yes | docker system prune
  yes | docker network prune
  yes | docker volume prune

fi
docker-compose up -d --build
#docker-compose exec -it next 'yes | pnpm install'
docker cp next:app/node_modules/ ./node_modules
