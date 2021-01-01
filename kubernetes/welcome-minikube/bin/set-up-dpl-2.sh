#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl config use-context ctx-1

MANIFESTS=../manifests
kubectl create -f ${MANIFESTS}/dpl-2.yaml
kubectl create -f ${MANIFESTS}/svc-2.yaml

popd
