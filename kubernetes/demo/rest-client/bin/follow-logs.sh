#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

POD=$(kubectl get pod --selector=app=rest-client -o jsonpath='{.items[*].metadata.name}')

kubectl logs -f "${POD}"

popd ; popd