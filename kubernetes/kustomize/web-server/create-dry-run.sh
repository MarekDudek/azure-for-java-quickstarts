#!/bin/bash
SCRIPT=$(readlink -f "$0")
PARENT=$(dirname "${SCRIPT}")
PARENT_REL=$(realpath --relative-to=. "${PARENT}")
IFS=$'\n\t'
set -euxo pipefail


NAME=nginx
kubectl create deployment ${NAME} --image=nginx --port=80 -o yaml --dry-run=client > "${PARENT_REL}"/k8s/deployment.yaml
kubectl create service nodeport ${NAME} --tcp=7072:80     -o yaml --dry-run=client > "${PARENT_REL}"/k8s/service.yaml