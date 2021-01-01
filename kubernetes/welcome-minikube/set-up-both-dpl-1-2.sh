#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


kubectl config use-context ctx-1
kubectl apply  -f ${THIS_DIR}/ns-1.yaml

${THIS_DIR}/bin/set-up-dpl-1.sh
${THIS_DIR}/set-up-dpl-2.sh
