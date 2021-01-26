#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

POD=$(kubectl get pod --selector=app=postgres -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- createuser --echo -U postgres -h localhost rest-server
kubectl exec "${POD}" -- psql              -U postgres -h localhost -c "ALTER USER \"rest-server\" WITH PASSWORD 'rest-server'"
kubectl exec "${POD}" -- createdb   --echo -U postgres -h localhost rest-server --owner=rest-server

popd