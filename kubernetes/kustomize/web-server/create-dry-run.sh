#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/app/base
NAME=web-server

kubectl create deployment $NAME \
  --image=nginx:stable \
  --port=80 \
  -o yaml --dry-run=client > "$BASE"/deployment.yaml

kubectl create service nodeport $NAME \
  --node-port=30000 \
  --tcp=7072:80 \
  -o yaml --dry-run=client > "$BASE"/nodeport-service.yaml

kubectl create service loadbalancer $NAME-loadbalancer \
  --tcp=7072:80  \
  -o yaml --dry-run=client > "$BASE"/loadbalancer-service.yaml