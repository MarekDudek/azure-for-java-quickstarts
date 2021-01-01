#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


URL=`minikube service echoserver-nodeport-service --namespace test --url`
wget ${URL} -q -O /dev/null
