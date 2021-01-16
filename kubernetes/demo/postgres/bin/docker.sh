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


docker run --name postgresql -p 5431:5432 -e POSTGRES_PASSWORD=postgres -d postgres
docker exec -it postgresql /bin/bash
psql -h localhost -p 5432 -U postgres -W
exit

psql -h localhost -U postgres -d postgres -p 5431

docker stop postgresql
docker rm postgresql