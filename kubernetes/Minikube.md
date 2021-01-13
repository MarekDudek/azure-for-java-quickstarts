# Minikube

## Dashboard

`minikube dashboard`


## Lifecycle

### Starting

`minikube start`

	😄  minikube v1.15.1 na Debian 10.7
	✨  Automatically selected the docker driver
	👍  Starting control plane node minikube in cluster minikube
	🚜  Pulling base image ...
	💾  Downloading Kubernetes v1.19.4 preload ...
	    > preloaded-images-k8s-v6-v1.19.4-docker-overlay2-amd64.tar.lz4: 486.35 MiB
	🔥  Creating docker container (CPUs=2, Memory=16000MB) ...
	🐳  Przygotowywanie Kubernetesa v1.19.4 na Docker 19.03.13...
	🔎  Verifying Kubernetes components...
	🌟  Enabled addons: storage-provisioner, default-storageclass
	💡  kubectl not found. If you need it, try: 'minikube kubectl -- get pods -A'
	🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

### Browsing

`kubectl get all`

`minikube kubectl -- get pods -A`

	    > kubectl.sha256: 64 B / 64 B [--------------------------] 100.00% ? p/s 0s
	    > kubectl: 41.01 MiB / 41.01 MiB [---------------] 100.00% 10.74 MiB p/s 4s
	NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
	kube-system   coredns-f9fd979d6-mgshm            1/1     Running   0          3m4s
	kube-system   etcd-minikube                      1/1     Running   0          3m5s
	kube-system   kube-apiserver-minikube            1/1     Running   0          3m4s
	kube-system   kube-controller-manager-minikube   1/1     Running   0          3m5s
	kube-system   kube-proxy-g6bn2                   1/1     Running   0          3m4s
	kube-system   kube-scheduler-minikube            1/1     Running   0          3m5s
	kube-system   storage-provisioner                1/1     Running   1          3m11s

`minikube kubectl cluster-info`

	Kubernetes master is running at https://192.168.49.2:8443
	KubeDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

	To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.


`minikube kubectl cluster-info dump`

### Cleaning all

`minikube delete --all`
