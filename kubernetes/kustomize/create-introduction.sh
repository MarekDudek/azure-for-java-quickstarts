#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl create -f ./introduction/deployment.yaml
kubectl create -f ./introduction/service.yaml

popd

