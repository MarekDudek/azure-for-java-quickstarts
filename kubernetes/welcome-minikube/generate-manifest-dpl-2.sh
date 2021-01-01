#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`

kubectl create deployment dpl-2 --image=k8s.gcr.io/echoserver:1.4 --namespace=ns-1 --dry-run=client -o yaml > ${THIS_DIR}/dpl-2.yaml
kubectl expose deployment dpl-2 --type=LoadBalancer --port=8080 --name=svc-2 --dry-run=client -o yaml > ${THIS_DIR}/svc-2.yaml
