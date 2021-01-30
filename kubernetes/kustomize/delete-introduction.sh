#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euo pipefail
pushd "${THIS_DIR}" &> /dev/null
set -x


kubectl delete -f ./introduction/deployment.yaml
kubectl delete -f ./introduction/service.yaml


popd &> /dev/null

