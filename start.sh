#!/bin/bash

dc down
yes '' | docker system prune
yes '' | docker network prune
yes '' | docker volume prune
docker-compose up -d --build
docker cp next:app/node_modules/ ./node_modules
