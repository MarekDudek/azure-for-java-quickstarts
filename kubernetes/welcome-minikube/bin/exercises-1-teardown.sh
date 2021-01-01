#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl delete -f ../manifests/nginx-pod.yaml
kubectl delete -f ../manifests/ckad-namespace.yaml

popd
