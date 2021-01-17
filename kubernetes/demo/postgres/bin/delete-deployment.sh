#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl delete -f "${CLAIM}"
kubectl delete -f "${VOLUME}"
kubectl delete -f "${CONFIG}"

popd ; popd