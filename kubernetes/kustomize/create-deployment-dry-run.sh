#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl create deployment nginx --image=nginx --port=80 -o yaml --dry-run=client > ./introduction/deployment.yaml

popd

