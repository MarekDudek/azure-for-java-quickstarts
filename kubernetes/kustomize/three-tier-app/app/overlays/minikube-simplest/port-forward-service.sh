#!/usr/bin/env bash
set -euxo pipefail

kubectl port-forward service/postgres-on-k8s 7777:5432