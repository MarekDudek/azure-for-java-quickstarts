#!/bin/bash
SCRIPT=$(readlink -f "$0")
PARENT=$(dirname "${SCRIPT}")
PARENT_REL=$(realpath --relative-to=. "${PARENT}")
IFS=$'\n\t'
set -euxo pipefail


kubectl port-forward service/nginx 8081:7072 &
PID=$!
sleep 1

wget localhost:8081 -O /dev/null
kill ${PID}