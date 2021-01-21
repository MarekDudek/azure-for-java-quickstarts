#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh

NODE_RESOURCE_GROUP=$(az aks show --resource-group "${RESOURCE_GROUP}" --name "${CLUSTER}" --query nodeResourceGroup -o tsv)
echo "${NODE_RESOURCE_GROUP}"

DISK_ID=$(az disk create --resource-group "${NODE_RESOURCE_GROUP}" --name "${AZURE_DISK}" --size-gb 10 --query id --output tsv)
echo "${DISK_ID}"

popd