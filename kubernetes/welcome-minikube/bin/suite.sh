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

./set-up-dpl-1.sh
./set-up-dpl-2.sh

./tear-down-dpl-1.sh
./tear-down-dpl-2.sh

kubectl config use-context minikube
kubectl config delete-context test

kubectl delete -f ../manifests/test-namespace.yaml

minikube stop 

popd
