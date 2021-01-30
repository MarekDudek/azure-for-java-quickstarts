#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euo pipefail
pushd "${THIS_DIR}" &> /dev/null
set -x


kubectl port-forward service/nginx 8080:7072 &> /dev/null &
PID=$!
sleep 1

wget localhost:8080 -O /dev/null -o /dev/null
kill ${PID}


popd &> /dev/null