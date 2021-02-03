#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/app/base
NAME=web-client

kubectl create deployment $NAME \
  --image=alpine:3.13.1 \
  -o yaml --dry-run=client > "$BASE"/deployment.yaml -- /bin/sh -c "
echo Querying web server
while true;
do
  wget \"\$WEB_SERVER\":\"\$PORT\" -O-
  sleep 1
done
"