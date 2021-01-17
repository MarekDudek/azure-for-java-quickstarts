#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh

az aks create \
  --resource-group "${RESOURCE_GROUP}" \
  --name "${CLUSTER}" \
  --kubernetes-version 1.18.14 \
  --generate-ssh-keys

popd