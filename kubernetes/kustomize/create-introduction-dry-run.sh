#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euo pipefail
pushd "${THIS_DIR}" &> /dev/null
set -x


NAME=nginx
kubectl create deployment ${NAME} --image=nginx --port=80 -o yaml --dry-run=client > ./introduction/deployment.yaml
kubectl create service nodeport ${NAME} --tcp=7072:80     -o yaml --dry-run=client > ./introduction/service.yaml


popd &> /dev/null

