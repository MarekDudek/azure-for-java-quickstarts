#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`


minikube delete --all

minikube start

${THIS_DIR}/set-up-both-dpl-1-2.sh
${THIS_DIR}/tear-down-both-dpl-1-2.sh

minikube stop 
