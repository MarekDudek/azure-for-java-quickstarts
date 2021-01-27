# AKS, ACAP to Several Nines' recommendations

## __azure__

### Deployment

1. `./bin/create-resource-group.sh`
1. `./bin/create-kubernetes-cluster.sh`
1. `./bin/connect-to-cluster.sh`
    requires confirmation on kubectl config overwrites
1. (optional) `./bin/get-kubectl-contexts.sh`

### Rollback

1. `./bin/delete-kubernetes-cluster.sh`
1. `./bin/delete-resource-group.sh`

## __postgres__

### Deployment

1. (optional) `./bin/get-kubectl-contexts.sh`
1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment-minikube-s9s.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/create-database-minikube-s9s.sh`
1. (optional) `./bin/port-forward-kubernetes-outside.sh`
1. (optional) login to check if DB created, credentials from s9s' `ConfigMap`

### Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. (optional) `./bin/drop-database-minikube-s9s.sh`
1. `./bin/delete-deployment-minikube-s9s.sh`

# __rest-server__

no change

# __rest-client__

no change
