#!/bin/bash

docker-compose down --remove-orphans
yes | docker system prune
yes | docker network prune
yes | docker volume prune
docker-compose up -d --build
#docker-compose exec -it next 'yes | pnpm install'
docker cp next:app/node_modules/ ./node_modules
