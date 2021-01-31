#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


kubectl kustomize "${DIR}"/k8s/overlays/production  > "${DIR}"/build/production.yaml
kubectl kustomize "${DIR}"/k8s/overlays/development > "${DIR}"/build/development.yaml