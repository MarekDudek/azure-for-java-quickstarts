#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

# 3

kubectl logs nginx --namespace=ckad
kubectl delete --namespace=ckad -f ../manifests/wget-from-nginx-pod.yaml

kubectl logs date-every-sec --namespace=ckad
kubectl delete --namespace=ckad -f ../manifests/date-every-sec-pod.yaml

# 1

kubectl delete --namespace=ckad -f ../manifests/nginx-pod.yaml 
kubectl delete -f ../manifests/ckad-namespace.yaml

popd
