#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

kubectl port-forward service/nginx 8080:7072 &>/dev/null &
PID=$!

sleep 10

wget localhost:8080

kill ${PID}

popd
