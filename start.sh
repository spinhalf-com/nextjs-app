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
  if [ -d node_modules ]; then
    echo "Fixing permissions for node_modules..."
    # try to change ownership to current user; ignore errors
    chown -R "$(id -u)":"$(id -g)" node_modules 2>/dev/null || true

    # try to remove; if that fails, try with sudo
    rm -rf node_modules 2>/dev/null || sudo rm -rf node_modules
  fi

  docker cp next:app/node_modules .
fi


