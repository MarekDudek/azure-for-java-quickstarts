#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl create deployment rest-server --image "${IMAGE}" --port 8082 -o yaml --dry-run=client > "${DEPLOYMENT}"
patch "${DEPLOYMENT}" best-practices.patch
patch "${DEPLOYMENT}" debugging.patch
#patch "${DEPLOYMENT}" spring-profiles-active.patch

kubectl create service nodeport rest-server --tcp=7072:8082 -o yaml --dry-run=client > "${SERVICE}"

popd ; popd