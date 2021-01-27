#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export CONFIG=s9s-postgres-configmap.yaml
export VOLUME=s9s-postgres-persistent-volume.yaml
export CLAIM=s9s-postgres-persistent-volume-claim.yaml
export DEPLOYMENT=s9s-postgres-deployment.yaml
export SERVICE=s9s-postgres-service.yaml