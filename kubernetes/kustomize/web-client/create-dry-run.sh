#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/app/base
NAME=web-client

COMMAND=$(cat "$BASE/command.sh")

kubectl create deployment $NAME \
  --image=bash \
  -o yaml --dry-run=client > "$BASE"/deployment.yaml -- /usr/local/bin/bash -c "$COMMAND"