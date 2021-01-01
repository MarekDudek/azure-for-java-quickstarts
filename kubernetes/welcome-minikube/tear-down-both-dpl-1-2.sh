#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`


kubectl config use-context ctx-1

${THIS_DIR}/tear-down-dpl-1.sh
${THIS_DIR}/tear-down-dpl-2.sh

kubectl delete -f ${THIS_DIR}/ns-1.yaml
