#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


kubectl config use-context ctx-1

kubectl create -f ${THIS_DIR}/dpl-2.yaml
kubectl create -f ${THIS_DIR}/svc-2.yaml
