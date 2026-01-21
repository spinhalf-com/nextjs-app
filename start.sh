#!/bin/bash

docker-compose down --remove-orphans
if [[ $1 = '-R' ]] || [[ $2 = '-R' ]] || [[ $3 = '-R' ]]
then
  read -p "This will destroy and rebuild the DB and all containers. Are you sure? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    rm -rf ./db_data/*
    yes | docker system prune
    yes | docker network prune
    yes | docker volume prune
  fi
fi
docker-compose up -d --build

if [[ $1 = '-C' ]] || [[ $2 = '-C' ]] || [[ $3 = '-C' ]]
then
  docker cp next:app/node_modules/ ./node_modules
fi

