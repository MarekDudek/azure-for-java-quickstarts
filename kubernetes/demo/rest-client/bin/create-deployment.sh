#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
pushd ../kubernetes

DEPLOYMENT=rest-client-deployment.yaml
kubectl create deployment rest-client --image marekdudek/rest-client --port 8081 -o yaml --dry-run=client > ${DEPLOYMENT}
patch ${DEPLOYMENT} best-practices.patch
kubectl create -f ${DEPLOYMENT}

SERVICE=rest-client-service.yaml
kubectl expose deployment rest-client --port 7071 --target-port=8081 --type=NodePort -o yaml --dry-run=client > ${SERVICE}
kubectl create -f ${SERVICE}

popd
popd