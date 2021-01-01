#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl create namespace ckad --dry-run=client -o yaml > ../manifests/ckad-namespace.yaml
kubectl create -f ../manifests/ckad-namespace.yaml

kubectl run nginx --image=nginx:1.17.10 --port=80 --namespace=ckad --dry-run=client -o yaml > ../manifests/nginx-pod.yaml
kubectl create -f ../manifests/nginx-pod.yaml

popd
