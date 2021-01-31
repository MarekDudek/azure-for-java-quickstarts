#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


kubectl port-forward service/web-server 8081:7072 &
PID=$!
sleep 1

wget localhost:8081 -O-
kill ${PID}