#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
pushd ../kubernetes

DEPLOYMENT=rest-server-deployment.yaml
kubectl create deployment rest-server --image marekdudek/rest-server --port 8082 -o yaml --dry-run=client > ${DEPLOYMENT}
patch ${DEPLOYMENT} best-practices.patch
kubectl create -f ${DEPLOYMENT}

SERVICE=rest-server-service.yaml
kubectl expose deployment rest-server --port 7072 --target-port=8082 --type=NodePort -o yaml --dry-run=client > ${SERVICE}
kubectl create -f ${SERVICE}

popd ; popd