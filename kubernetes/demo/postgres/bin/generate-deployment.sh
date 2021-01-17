#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl create configmap postgres-config --from-literal POSTGRES_PASSWORD=postgres -o yaml --dry-run=client > "${CONFIG}"

popd ; popd