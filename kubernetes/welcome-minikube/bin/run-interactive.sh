#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

kubectl run busybox --image=busybox --rm -it -- /bin/sh
kubectl exec -it nginx -- /bin/sh
kubectl run busybox --image=busybox --restart=OnFailure -- wget www.google.com
