#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common-minikube-s9s.sh
pushd ../kubernetes

POD=$(kubectl get pod --selector=app=postgres -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- dropdb     --echo -U postgresadmin -h localhost rest-server
kubectl exec "${POD}" -- dropuser   --echo -U postgresadmin -h localhost rest-server

popd