#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

MANIFESTS=./manifests/

kubectl config use-context ctx-1

kubectl create -f ${MANIFESTS}/dpl-2.yaml
kubectl create -f ${MANIFESTS}/svc-2.yaml

popd
