#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl config set-context ctx-1 --cluster=minikube --user=minikube --namespace=ns-1
kubectl config use-context ctx-1 

kubectl apply  -f ../manifests/ns-1.yaml

DEPLOYMENT=../manifests/deployment-2.yaml
kubectl create deployment dpl-2 --image=k8s.gcr.io/echoserver:1.4 --namespace=ns-1 --dry-run=client -o yaml > ${DEPLOYMENT}
kubectl create -f ${DEPLOYMENT}

SERVICE=../manifests/service-2.yaml
kubectl expose deployment dpl-2 --type=LoadBalancer --port=8080 --name=service-2   --dry-run=client -o yaml > ${SERVICE}
kubectl create -f ${SERVICE}

kubectl delete -f ${SERVICE}
kubectl delete -f ${DEPLOYMENT}

popd
