#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail

function check_service() {

  SERVICE_NAME=$1
  SERVICE_PORT=$2
  LOCAL_PORT=18080

  kubectl port-forward service/"$SERVICE_NAME" $LOCAL_PORT:"$SERVICE_PORT" &
  PID=$!

  sleep 1
  wget --spider --quiet localhost:$LOCAL_PORT

  kill $PID
}

check_service web-server-cip 7071
check_service web-server-np  7072
check_service web-server-lb  7073