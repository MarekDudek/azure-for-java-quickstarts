#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export CONFIG=postgres-config.yaml
export VOLUME=postgres-persistent-volume.yaml
export CLAIM=postgres-persistent-volume-claim.yaml