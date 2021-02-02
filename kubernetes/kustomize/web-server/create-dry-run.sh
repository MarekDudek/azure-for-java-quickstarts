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

kubectl create service clusterip $NAME \
  --tcp=7071:80 \
  -o yaml --dry-run=client > "$BASE"/service-clusterip.yaml

kubectl create service nodeport $NAME \
  --node-port=30000 \
  --tcp=7072:80 \
  -o yaml --dry-run=client > "$BASE"/service-nodeport.yaml

kubectl create service loadbalancer $NAME \
  --tcp=7073:80  \
  -o yaml --dry-run=client > "$BASE"/service-loadbalancer.yaml