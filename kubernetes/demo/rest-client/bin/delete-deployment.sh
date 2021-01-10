#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl delete -f ../kubernetes/rest-client-deployment.yaml
kubectl delete -f ../kubernetes/rest-client-service.yaml

popd