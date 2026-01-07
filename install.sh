#!/bin/bash

docker exec -it next yes | pnpm install
docker cp next:app/node_modules/ ./node_modules
