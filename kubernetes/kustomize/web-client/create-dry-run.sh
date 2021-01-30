#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


NAME=web-client
kubectl create deployment ${NAME} --image=alpine -o yaml --dry-run=client > "${DIR}"/k8s/deployment.yaml