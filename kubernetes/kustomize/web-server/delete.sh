#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


kubectl delete -f "${DIR}"/app/base/deployment.yaml
kubectl delete -f "${DIR}"/app/base/service.yaml
