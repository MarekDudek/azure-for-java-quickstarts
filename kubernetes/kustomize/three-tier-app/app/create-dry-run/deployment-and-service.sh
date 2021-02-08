#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/../base

NAME=postgres-on-k8s

kubectl create deployment $NAME \
  --image=postgres:latest \
  --port=5432 \
  -o yaml --dry-run=client > "$BASE"/postgres-on-k8s-deployment.yaml

kubectl create service clusterip $NAME \
  --tcp=5432 \
  -o yaml --dry-run=client > "$BASE"/postgres-on-k8s-service-clusterip.yaml

COMMAND=$(cat "$DIR/set-up-db.sh")

kubectl create job $NAME-job-to-set-up-db \
  --image=postgres:latest \
  -o yaml --dry-run=client > "$BASE"/postgres-on-k8s-job-to-set-up-db.yaml \
  -- /bin/sh -c "$COMMAND"