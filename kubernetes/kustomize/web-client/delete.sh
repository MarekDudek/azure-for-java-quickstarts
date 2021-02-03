#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


SNAPSHOT="$DIR"/versions/v-003

kubectl delete -f "${SNAPSHOT}"/with-clusterip/__kustomized.yaml
kubectl delete -f "${SNAPSHOT}"/with-nodeport/__kustomized.yaml
kubectl delete -f "${SNAPSHOT}"/with-loadbalancer/__kustomized.yaml