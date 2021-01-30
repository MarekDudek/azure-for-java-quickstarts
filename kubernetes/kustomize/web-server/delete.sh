#!/bin/bash
SCRIPT=$(readlink -f "$0")
PARENT=$(dirname "${SCRIPT}")
PARENT_REL=$(realpath --relative-to=. "${PARENT}")
IFS=$'\n\t'
set -euxo pipefail


kubectl delete -f "${PARENT_REL}"/k8s/deployment.yaml
kubectl delete -f "${PARENT_REL}"/k8s/service.yaml
