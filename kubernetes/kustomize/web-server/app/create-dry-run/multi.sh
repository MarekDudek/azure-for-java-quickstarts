#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/../base
NAME=multi

kubectl create deployment $NAME \
  --image=nginx:stable \
  --port=80 \
  -o yaml --dry-run=client > "$BASE"/multi-main.yaml

COMMAND=$(cat "$DIR/writer-command.sh")

kubectl create deployment $NAME \
  --image=bash \
  -o yaml --dry-run=client > "$BASE"/multi-writer.yaml \
  -- /usr/local/bin/bash -c "$COMMAND"

sed -i 's/name: bash/name: writer/' "$BASE"/multi-writer.yaml


COMMAND=$(cat "$DIR/reader-command.sh")

kubectl create deployment $NAME \
  --image=bash \
  -o yaml --dry-run=client > "$BASE"/multi-reader.yaml \
  -- /usr/local/bin/bash -c "$COMMAND"

sed -i 's/name: bash/name: reader/' "$BASE"/multi-reader.yaml