#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl create -f "${CONFIG}"
kubectl create -f "${VOLUME}"
kubectl create -f "${CLAIM}"
kubectl create -f "${DEPLOYMENT}"

popd ; popd