#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl create deployment rest-client --image marekdudek/rest-client --port 8081 -o yaml --dry-run=client > "${DEPLOYMENT}"
patch "${DEPLOYMENT}" best-practices.patch
patch "${DEPLOYMENT}" volume.patch

kubectl expose deployment rest-client --port 7071 --target-port=8081 --type=NodePort -o yaml --dry-run=client > "${SERVICE}"

kubectl create configmap rest-client-config --from-file=application.properties -o yaml --dry-run=client > "${CONFIG}"

popd ; popd