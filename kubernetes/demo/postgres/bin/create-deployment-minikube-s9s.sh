#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common-minikube-s9s.sh
pushd ../kubernetes

kubectl create -f "${CONFIG}"
kubectl create -f "${STORAGE}"
kubectl create -f "${DEPLOYMENT}"
kubectl create -f "${SERVICE}"

popd ; popd