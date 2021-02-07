#!/bin/bash
set -euox pipefail

POD=$(kubectl get pod --selector=app=postgres-on-k8s -o jsonpath='{.items[*].metadata.name}')

kubectl exec "${POD}" -- dropdb   --echo -U postgres my_db
kubectl exec "${POD}" -- dropuser --echo -U postgres db_user