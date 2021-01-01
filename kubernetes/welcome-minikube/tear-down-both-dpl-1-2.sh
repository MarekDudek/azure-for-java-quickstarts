#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


${THIS_DIR}/tear-down-dpl-1.sh
${THIS_DIR}/tear-down-dpl-2.sh

kubectl config use-context ctx-1
kubectl delete -f ${THIS_DIR}/ns-1.yaml
