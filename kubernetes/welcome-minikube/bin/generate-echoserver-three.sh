#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl config set-context pre-test --cluster=minikube --user=minikube --namespace=pre-test
kubectl config use-context pre-test

kubectl apply  -f ../manifests/pre-test-namespace.yaml

POD=../manifests/echoserver-three-pod.yaml
kubectl run echoserver-three --image=k8s.gcr.io/echoserver:1.4 --port 8080 --dry-run=client -o yaml > ${POD}
kubectl create -f ${POD}

kubectl delete -f ${POD}

kubectl config use-context minikube
kubectl config delete-context pre-test

popd
