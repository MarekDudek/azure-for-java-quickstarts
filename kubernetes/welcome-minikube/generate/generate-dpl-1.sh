#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

MANIFESTS=./../manifests

kubectl config set-context ctx-1 --cluster=minikube --user=minikube --namespace=ns-1
kubectl config use-context ctx-1 

DEPLOYMENT=${MANIFESTS}/deployment-1.yaml
kubectl create deployment dpl-1 --image=k8s.gcr.io/echoserver:1.4 --namespace=ns-1 --dry-run=client -o yaml > ${DEPLOYMENT}
kubectl create -f ${DEPLOYMENT}

SERVICE=${MANIFESTS}/service-1.yaml
kubectl expose deployment dpl-1 --type=LoadBalancer --port=8080 --name=service-2   --dry-run=client -o yaml > ${SERVICE}
kubectl create -f ${SERVICE}

kubectl delete -f ${SERVICE}
kubectl delete -f ${DEPLOYMENT}

popd
