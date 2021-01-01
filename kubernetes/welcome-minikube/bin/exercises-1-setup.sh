#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR}

# 1

CKAD=../manifests/ckad-namespace.yaml
kubectl create namespace ckad --dry-run=client -o yaml > ${CKAD}
kubectl create -f ${CKAD}
#
NGINX=../manifests/nginx-pod.yaml
kubectl run nginx --image=nginx:1.17.10 --port=80 --dry-run=client -o yaml > ${NGINX}
kubectl create --namespace=ckad -f ${NGINX} 

# 2
kubectl get pod nginx --namespace=ckad --output=wide
kubectl describe pod nginx --namespace=ckad | grep "^IP:"

# 3
DATE_EVERY_SEC=../manifests/date-every-sec-pod.yaml
kubectl run date-every-sec --image=busybox --port=8080 --dry-run=client -o yaml > ${DATE_EVERY_SEC} -- /bin/sh -c "while true; do date; sleep 1; done" 
kubectl create --namespace=ckad -f ${DATE_EVERY_SEC}

n=0; 
until ((n >= 60)); 
do 
  NGINX_IP=`kubectl get pod nginx --namespace=ckad --output=jsonpath='{.status.podIP}'`;
  if [ -z "$NGINX_IP" ]
  then 
	echo waiting ...
  else
	break;
  fi
  n=$((n + 1)); 
  sleep 1; 
done; 


WGET_FROM_NGINX=../manifests/wget-from-nginx-pod.yaml
kubectl run wget-from-nginx --image=busybox --port=8080 --dry-run=client -o yaml > ${WGET_FROM_NGINX} -- /bin/sh -c "while true; do wget ${NGINX_IP}:80 -O /dev/null; sleep 1; done"
kubectl create --namespace=ckad -f ${WGET_FROM_NGINX}

popd
