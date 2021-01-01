#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

minikube delete --all

minikube start

kubectl config set-context test --cluster=minikube --user=minikube --namespace=test
kubectl config use-context test

kubectl create -f ../manifests/test-namespace.yaml

kubectl create -f ../manifests/echoserver-one-deployment.yaml
kubectl create -f ../manifests/echoserver-one-service.yaml

kubectl create -f ../manifests/echoserver-two-deployment.yaml
kubectl create -f ../manifests/echoserver-two-service.yaml

popd
