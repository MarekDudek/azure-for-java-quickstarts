# `minikube` closest to Several Nines' recommendations

## __postgres__

### Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment-minikube-s9s.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/create-database-minikube-s9s.sh`

### Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. (optional) `./bin/drop-database-minikube-s9s.sh`
1. `./bin/delete-deployment-minikube-s9s.sh`

# __rest-server__

no change

# __rest-client__

no change
