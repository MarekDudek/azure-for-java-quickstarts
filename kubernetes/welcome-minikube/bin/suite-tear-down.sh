#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl delete -f ../manifests/echoserver-two-service.yaml
kubectl delete -f ../manifests/echoserver-two-deployment.yaml

kubectl delete -f ../manifests/echoserver-one-service.yaml
kubectl delete -f ../manifests/echoserver-one-deployment.yaml

kubectl delete -f ../manifests/echoserver-three-pod.yaml

kubectl config use-context minikube
kubectl config delete-context test

kubectl delete -f ../manifests/test-namespace.yaml

minikube stop 

popd
