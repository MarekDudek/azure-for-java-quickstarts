#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

kubectl create deployment nginx --image=nginxkubectl exec -it nginx -- /bin/sh
kubectl run busybox --image=busybox --restart=OnFailure -- wget www.google.com
