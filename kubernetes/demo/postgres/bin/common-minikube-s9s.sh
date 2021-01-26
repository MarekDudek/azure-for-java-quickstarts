#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export CONFIG=s9s-postgres-configmap.yaml
export STORAGE=s9s-postgres-storage.yaml
export DEPLOYMENT=s9s-postgres-deployment.yaml
export SERVICE=s9s-postgres-service.yaml