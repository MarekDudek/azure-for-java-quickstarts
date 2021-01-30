#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl create service nodeport nginx --tcp=7072:80     -o yaml --dry-run=client > ./introduction/service.yaml

popd

