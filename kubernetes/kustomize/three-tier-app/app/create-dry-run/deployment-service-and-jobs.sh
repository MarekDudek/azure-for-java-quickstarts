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

SET_UP_DB=$(cat "$DIR/set-up-db.sh")

kubectl create job $NAME-job-to-set-up-db \
  --image=postgres:latest \
  -o yaml --dry-run=client > "$BASE"/postgres-on-k8s-job-to-set-up-db.yaml \
  -- /bin/sh -c "$SET_UP_DB"

TEAR_DOWN_DB=$(cat "$DIR/tear-down-db.sh")

kubectl create job $NAME-job-to-tear-down-db \
  --image=postgres:latest \
  -o yaml --dry-run=client > "$BASE"/postgres-on-k8s-job-to-tear-down-db.yaml \
  -- /bin/sh -c "$TEAR_DOWN_DB"

INSERT_DB=$(cat "$DIR/insert-db.sh")

kubectl create cronjob $NAME-cronjob-insert-db \
  --image=postgres:latest \
  --schedule '* * * * *' \
  -o yaml --dry-run=client > "$BASE"/postgres-on-k8s-cronjob-insert-db.yaml \
  -- /bin/sh -c "$INSERT_DB"