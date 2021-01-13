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
