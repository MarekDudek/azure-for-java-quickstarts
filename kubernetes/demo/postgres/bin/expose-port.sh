#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

kubectl port-forward service/postgres  5439:5431