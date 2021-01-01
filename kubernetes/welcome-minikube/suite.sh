#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

minikube delete --all

minikube start

kubectl config set-context ctx-1 --cluster=minikube --user=minikube --namespace=ns-1

${THIS_DIR}/set-up-both-dpl-1-2.sh
${THIS_DIR}/tear-down-both-dpl-1-2.sh

kubectl config use-context minikube
kubectl config delete-context ctx-1

minikube stop 
