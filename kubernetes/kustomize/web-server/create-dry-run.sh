#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


NAME=web-server
kubectl create deployment ${NAME} --image=nginx --port=80 -o yaml --dry-run=client > "${DIR}"/k8s/base/deployment.yaml
kubectl create service nodeport ${NAME} --tcp=7072:80     -o yaml --dry-run=client > "${DIR}"/k8s/base/service.yaml