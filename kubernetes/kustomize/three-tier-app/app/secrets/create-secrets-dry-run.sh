#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

BASE="$DIR"/../base

kubectl create secret generic pg-db-admin-credentials \
  --type=kubernetes.io/basic-auth \
  --from-literal=username=postgres \
  --from-literal=password=postgres \
  -o yaml --dry-run=client > "$BASE"/pg-db-admin-credentials.yaml


kubectl create secret generic pg-db-admin-credentials-alt \
  --type=kubernetes.io/basic-auth \
  --from-literal=username=postgres \
  --from-literal=password=minikube \
  -o yaml --dry-run=client > "$BASE"/pg-db-admin-credentials-alt.yaml