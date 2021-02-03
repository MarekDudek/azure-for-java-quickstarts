#!/usr/bin/env bash
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

function check_service_minikube() {

    SERVICE_NAME=$1

    URL=$(minikube service "$SERVICE_NAME" --url )
    wget --spider --quiet "$URL"
}

function check_service_minikube_alt() {

    SERVICE_NAME=$1

    MINIKUBE_VM_IP=$(minikube ip)
    PORT=$(kubectl get service "$SERVICE_NAME" --output='jsonpath={.spec.ports[*].nodePort}')

    URL="$MINIKUBE_VM_IP":"$PORT"
    wget --spider --quiet "$URL"
}

check_service web-server-cip 7071
check_service web-server-np  7072
check_service web-server-lb  7073

check_service_minikube web-server-np
check_service_minikube web-server-lb

check_service_minikube_alt web-server-np
check_service_minikube_alt web-server-lb