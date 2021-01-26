#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common-minikube-s9s.sh
pushd ../kubernetes

kubectl delete -f "${SERVICE}"
kubectl delete -f "${DEPLOYMENT}"
kubectl delete -f "${STORAGE}"
kubectl delete -f "${CONFIG}"

popd ; popd