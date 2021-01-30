#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euo pipefail
pushd "${THIS_DIR}" &> /dev/null
set -x


kubectl create -f ./introduction/deployment.yaml
kubectl create -f ./introduction/service.yaml


popd &> /dev/null

