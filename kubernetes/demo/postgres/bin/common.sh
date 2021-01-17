#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

export CONFIG=postgres-config.yaml