#!/usr/bin/env bash
set -euxo pipefail

POD=$(kubectl get pod --selector=app=postgres-on-k8s -o jsonpath='{.items[*].metadata.name}')

kubectl exec --stdin --tty "${POD}" -- /usr/bin/env bash