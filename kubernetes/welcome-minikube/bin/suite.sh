#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

./suite-set-up.sh

sleep 30 
minikube service list --namespace test
./test-echoserver-one.sh
./test-echoserver-two.sh

./suite-tear-down.sh

popd
