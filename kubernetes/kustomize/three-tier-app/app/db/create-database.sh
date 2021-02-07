#!/bin/bash
set -euox pipefail

POD=$(kubectl get pod --selector=app=postgres-on-k8s -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- createuser --echo -U postgres db_user
kubectl exec "${POD}" -- psql              -U postgres -c "ALTER USER \"db_user\" WITH PASSWORD 'db_user'"
kubectl exec "${POD}" -- createdb   --echo -U postgres --owner=db_user my_db