#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


kubectl config use-context ctx-1

kubectl delete -f ${THIS_DIR}/svc-1.yaml
kubectl delete -f ${THIS_DIR}/dpl-1.yaml
