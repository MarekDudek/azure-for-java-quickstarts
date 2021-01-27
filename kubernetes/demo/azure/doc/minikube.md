# `minikube`

## __postgres__

### Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment-minikube.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/create-database-minikube.sh`

### Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. (optional) `./bin/drop-database-minikube.sh`
1. `./bin/delete-deployment-minikube.sh`

## __rest-server__

### Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment.sh`
1. (optional) `./bin/follow-logs.sh`

### Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/delete-deployment.sh`

## __rest-client__

### Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment.sh`
1. (optional) `./bin/follow-logs.sh`

### Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/delete-deployment.sh`
