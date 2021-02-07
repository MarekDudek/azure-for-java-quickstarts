#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail


POD=$(kubectl get pod --selector=app=postgres-on-k8s -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- createuser --echo -U postgres -h localhost db_user
kubectl exec "${POD}" -- psql              -U postgres -h localhost -d postgres -c "ALTER USER \"db_user\" WITH PASSWORD 'db_user'"
kubectl exec "${POD}" -- createdb   --echo -U postgres -h localhost --owner=db_user my_db