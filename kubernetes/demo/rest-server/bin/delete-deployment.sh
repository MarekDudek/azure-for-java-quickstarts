#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl delete -f ../kubernetes/rest-server-deployment.yaml
kubectl delete -f ../kubernetes/rest-server-service.yaml

popd