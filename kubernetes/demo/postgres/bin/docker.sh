#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

docker run --name my-postgres -e POSTGRES_PASSWORD=marek -d postgres
docker stop my-postgres
docker start my-postgres
sleep 10
docker exec -it my-postgres psql -U postgres
docker stop my-postgres
docker rm my-postgres