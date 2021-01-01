#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

pushd ${THIS_DIR}

MANIFESTS=./../manifests/

kubectl config set-context ctx-1 --cluster=minikube --user=minikube --namespace=ns-1
kubectl config use-context ctx-1 

kubectl create deployment dpl-1 --image=k8s.gcr.io/echoserver:1.4 --namespace=ns-1 --dry-run=client -o yaml > ${MANIFESTS}/deployment-2.yaml
kubectl apply -f ${MANIFESTS}/deployment-2.yaml
kubectl expose deployment dpl-1 --type=LoadBalancer --port=8080 --name=service-2   --dry-run=client -o yaml > ${MANIFESTS}/service-2.yaml
kubectl apply -f ${MANIFESTS}/service-2.yaml

popd
