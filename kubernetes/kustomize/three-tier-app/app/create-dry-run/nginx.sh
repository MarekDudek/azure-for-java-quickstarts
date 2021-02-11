#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/../base

NAME=nginx-on-k8s

kubectl create deployment $NAME \
  --image=nginx:stable \
  --port=80 \
  -o yaml --dry-run=client > "$BASE"/nginx-on-k8s-deployment.yaml

kubectl create service clusterip $NAME \
  --tcp=80:80 \
  -o yaml --dry-run=client > "$BASE"/nginx-on-k8s-service-clusterip.yaml
