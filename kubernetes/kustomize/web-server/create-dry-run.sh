#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


NAME=web-server

kubectl create deployment ${NAME} \
  --image=nginx:stable \
  --port=80 \
  -o yaml --dry-run=client > "${DIR}"/app/base/deployment.yaml

kubectl create service nodeport ${NAME} \
  --node-port=30000 \
  --tcp=7072:80 \
  -o yaml --dry-run=client > "${DIR}"/app/base/nodeport-service.yaml

kubectl create service loadbalancer ${NAME}-loadbalancer \
  --tcp=7072:80  \
  -o yaml --dry-run=client > "${DIR}"/app/base/loadbalancer-service.yaml