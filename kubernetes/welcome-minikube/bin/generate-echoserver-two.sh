#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl config set-context pre-test --cluster=minikube --user=minikube --namespace=pre-test
kubectl config use-context pre-test

kubectl apply  -f ../manifests/pre-test-namespace.yaml

DEPLOYMENT=../manifests/echoserver-two-deployment.yaml
kubectl create deployment echoserver-two --image=k8s.gcr.io/echoserver:1.4 --dry-run=client -o yaml > ${DEPLOYMENT}
kubectl create -f ${DEPLOYMENT}

SERVICE=../manifests/echoserver-two-service.yaml
kubectl expose deployment echoserver-two --type=LoadBalancer --port=8080 --name=echoserver-loadbalancer-service --dry-run=client -o yaml > ${SERVICE}
kubectl create -f ${SERVICE}

kubectl delete -f ${SERVICE}
kubectl delete -f ${DEPLOYMENT}

kubectl config use-context minikube
kubectl config delete-context pre-test

popd
