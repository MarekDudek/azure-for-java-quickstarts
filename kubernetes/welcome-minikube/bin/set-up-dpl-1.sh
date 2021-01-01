#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


kubectl create -f ../manifests/deployment-1.yaml
kubectl create -f ../manifests/service-1.yaml
