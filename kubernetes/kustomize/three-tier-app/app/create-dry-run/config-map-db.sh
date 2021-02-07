#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/../base

kubectl create configmap config-map-postgres \
  --from-literal POSTGRES_DB=default-db \
  --from-literal POSTGRES_USER=db-admin \
  --from-literal POSTGRES_PASSWORD="#xkFB^G],WL2UaU6" \
  -o yaml --dry-run=client > "$BASE"/config-map-postgres.yaml
