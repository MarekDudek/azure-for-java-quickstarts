#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl config use-context ctx-1

kubectl delete -f ../manifests/service-2.yaml
kubectl delete -f ../manifests/deployment-2.yaml

popd
