#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


NAME=web-client
kubectl create deployment ${NAME} --image=alpine:latest -o yaml --dry-run=client > "${DIR}"/app/base/deployment.yaml -- /bin/sh -c "
echo Querying web server
while true;
do
  wget web-server:7072 -O-
  sleep 1
done
"