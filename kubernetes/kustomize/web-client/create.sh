#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


kubectl create -f "${DIR}"/k8s/base/deployment.yaml