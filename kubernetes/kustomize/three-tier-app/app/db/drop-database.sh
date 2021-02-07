#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail


POD=$(kubectl get pod --selector=app=postgres-on-k8s -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- dropdb   --echo -U postgres my_db
kubectl exec "${POD}" -- dropuser --echo -U postgres db_user