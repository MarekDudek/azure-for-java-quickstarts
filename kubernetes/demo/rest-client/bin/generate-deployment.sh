#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl create configmap rest-client-config --from-file=application.properties -o yaml --dry-run=client > "${CONFIG}"

kubectl create deployment rest-client --image "${IMAGE}" --port 8081 -o yaml --dry-run=client > "${DEPLOYMENT}"
patch "${DEPLOYMENT}" best-practices.patch
patch "${DEPLOYMENT}" volume.patch
patch "${DEPLOYMENT}" spring-profiles-active.patch
patch "${DEPLOYMENT}" debugging.patch

kubectl create service nodeport rest-client --tcp=7071:8081 -o yaml --dry-run=client > "${SERVICE}"

popd ; popd