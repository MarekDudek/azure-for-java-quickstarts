#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export DEPLOYMENT=rest-client-deployment.yaml
export SERVICE=rest-client-service.yaml
export CONFIG=rest-client-config.yaml

export IMAGE=marekdudek/rest-client