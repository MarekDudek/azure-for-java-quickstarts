#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euo pipefail
pushd "${THIS_DIR}" &> /dev/null
set -x


kubectl port-forward service/nginx 8081:7072 &
PID=$!
sleep 1

wget localhost:8081 -O /dev/null

kill ${PID}


popd