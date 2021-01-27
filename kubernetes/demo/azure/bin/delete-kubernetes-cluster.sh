#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh

time az aks delete --resource-group "${RESOURCE_GROUP}" --name "${CLUSTER}" --yes

popd