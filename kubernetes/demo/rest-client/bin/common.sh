#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

# shellcheck disable=SC2034
DEPLOYMENT=rest-client-deployment.yaml
# shellcheck disable=SC2034
SERVICE=rest-client-service.yaml
# shellcheck disable=SC2034
CONFIG=rest-client-config.yaml
