#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

kubectl config use-context ctx-1
kubectl apply  -f ../manifests/ns-1.yaml

./set-up-dpl-1.sh
./set-up-dpl-2.sh

popd
