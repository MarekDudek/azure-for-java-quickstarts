#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl create -f ../manifests/deployment-2.yaml
kubectl create -f ../manifests/service-2.yaml

popd
