#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

kubectl config use-context ctx-1
kubectl delete -f ${THIS_DIR}/svc-1.yaml
kubectl delete -f ${THIS_DIR}/dpl-1.yaml
kubectl delete -f ${THIS_DIR}/ns-1.yaml
