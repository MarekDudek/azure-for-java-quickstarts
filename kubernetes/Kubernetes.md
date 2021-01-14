# Kubernetes

## Contexts

* `kubectl config get-contexts`

|CURRENT   |NAME           |CLUSTER        |AUTHINFO                                         |NAMESPACE |
|----------|---------------|---------------|-------------------------------------------------|----------|
|          |k8s-on-azure   |k8s-on-azure   |clusterUser_kubernetes-cluster-rg_k8s-on-azure   |		|
|          |kuar-cluster   |kuar-cluster   |clusterUser_kuar_kuar-cluster                    |		|
|*         |minikube       |minikube       |minikube                                         |default	|
|          |test           |minikube       |minikube                                         |test	|

* `kubectl config set-context minikube`

## Logs

* dump logs

`kubectl logs my-pod` 

* stream logs

`kubectl logs -f my-pod`

## Accessing container

* Run command

`kubectl exec my-pod -- ls /workspace`

* Interactive shell access

`kubectl exec --stdin --tty my-pod -- /bin/bash`

## Passing parameters

`kubectl run my-pod --image= --env SPRING_PROFILES_ACTIVE=profile`
