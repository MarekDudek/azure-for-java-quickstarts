#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl create deployment rest-server --image marekdudek/rest-server --port 8082 -o yaml --dry-run=client > ../kubernetes/rest-server-deployment.yaml
kubectl create -f ../kubernetes/rest-server-deployment.yaml

kubectl expose deployment rest-server --port 7072 --target-port=8082 --type=NodePort -o yaml --dry-run=client > ../kubernetes/rest-server-service.yaml
kubectl create -f ../kubernetes/rest-server-service.yaml

popd