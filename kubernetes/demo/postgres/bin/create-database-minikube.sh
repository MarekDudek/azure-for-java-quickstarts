#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

POD=$(kubectl get pod --selector=app=postgres -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- createuser --echo rest-server -U postgres -h localhost
kubectl exec "${POD}" -- createdb   --echo --owner=rest-server rest-server -U postgres -h localhost

popd