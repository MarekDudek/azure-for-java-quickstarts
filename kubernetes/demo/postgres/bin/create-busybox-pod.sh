#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh
pushd ../kubernetes

kubectl run busybox --image=busybox --port=8080 --dry-run=client -o yaml > "${BUSYBOX}" -- /bin/sh -c "while true; do sleep 1; done"

popd