#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export RESOURCE_GROUP=kubernetes-demo-rg
export LOCATION=westeurope
export CLUSTER=kubernetes-demo
export AZURE_DISK=disk-for-kubernetes