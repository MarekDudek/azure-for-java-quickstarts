#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export DEPLOYMENT=rest-server-deployment.yaml
export SERVICE=rest-server-service.yaml