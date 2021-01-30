#!/bin/bash
SCRIPT=$(readlink -f "$0")
PARENT=$(dirname "${SCRIPT}")
PARENT_REL=$(realpath --relative-to=. "${PARENT}")
IFS=$'\n\t'
set -euxo pipefail


kubectl create -f "${PARENT_REL}"/k8s/deployment.yaml
kubectl create -f "${PARENT_REL}"/k8s/service.yaml
