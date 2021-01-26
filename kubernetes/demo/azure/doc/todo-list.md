# To-do list

## Automate everything

### To-do list

1. ~~deploy to _minikube_~~
1. automate deployment to _minikube_   
1. copy Several Nines' recommendation
1. deploy it to _minikube_
1. deploy it to _AKS_
1. create Pod with all `Persistent Volume`s mounted
1. create `Persistent Volume` and the rest with Azure's recommendation, static disc
1. create three other options and deploy to _AKS_
1. all with scripts
1. configure with `kustomize`

### Manual steps necessary now

* __postgres__ `create-deployment.sh` is good for _minikube_, 
  assumes deployment _YAML_ based on different disk
* __postgres__ storage class can be custom
* __postgres__ setting password:
  * on minikube doesn't ask for it, is password default?
  * what is default password?
  * should be read from **K8S**'s `Secret`
* __postgres__ creation of DB is manual, requires port-forwarding
  * `connect-to-psql.sh` assumes port, which is different
    * _minikube_ and _AKS_
    * DB instances on local vs cloud instances
    * these aspects cross-cut
    * multiple ports to be able to have access to all of them 
      for debugging and running against
    * list possibilities
      * default for PostgreSQL is 5432, let's not use it to avoid confusion
      * currently, all instances use it, 
        * it can be changed only by editing file on disk? 
      * 5431 - __postgres__ exposes **K8S** `Service` with this TCP port under `postgres` name
        also, coincidentally, Docker exposes this port in `docker.sh`, but on localhost
      * 5439 - kubernetes-outside, Spring's profile for running 
        local __rest-server__ against DB on _minikube_
        * `port-forward.sh` script uses it
            * only for DB installed on *K8S*
            * a local instance requires nothing
            * PostgreSQL Azure perhaps does, only   
        * this description is slightly wrong, could work foth on _minikube_ and _Azure_
    * find better convention for ports
      * a local instance: 5432
      * **K8S** `Service` 15432 instead of 5431, used internally by __rest-server__ 
        with `postgres-kubernetes` profile
      * **Docker** service - ?  
      * 15401, 15402
    * point of flexibility in `kustomization`
  * can be solved with **K8S**'s `Job` object
  * creating and dropping DB is possible with 
    * SQL script - no ports in SQL but `psql` command has ports
      * `psql` command accepts
        * port
        * host - but with port-forwarding always localhost, so port specifies host
      * local   
    * bash command - accepts ports
    * IntelliJ
        * SQL scripts are in __rest-server__
* __postgres__ creation of disk for Azure is not 
  in `create-deployment.sh`
* PostgreSQL requires some time to start, deployment of __rest-server__ should wait, 
    otherwise it reports errors from cron job
  * how to script it?
    * fix cron job

#### Figure out paths for PostgreSQL

* __azure__ creation of disk should be in __postgres__

## Develop customizations for environments:

* _minikube_
* _Azure_
* GSA?

`with kustomize`

* kubernetes-based PostgreSQL backed with
    * default `Persistent Volue` - find out where data lands, on container probably
    * reasonable `Persisten Volume`s:
    * static and dynamic
    * Azure Disk and Azure File
* PostgreSQL Azure PaaS
* Redis cache  
    * Azure Redis Cache
    * kubernetes-based
* HTTP cache

## Add new technologies

* Rabbit MQ
* anther JMS-compliant?
* Kafka
    * Confluent platform

## Follow-up

* **K8S**'-specific code should be moved from their modules
  * __rest-server__ depends on __postgres__ - organize into `Deployment`
  * __postgres__ can depend on Azure
* expose data from PostgreSQL with PostgREST
* use _minikube_'s mounts to run PostgreSQL on local files
* logging
* monitoring
* add selectors
* `Pod` with all disks mounted on it 
* Figure out work-flow for Liquibase, it breaks when running tests locally first?
* Security

## Questions: 
* shouldn't __rest-client__ be part of thie same `Deployment`
  * pros and cons
    * no API incompatibility ...
    * ... but it is easy to avoid
      * _blue-green_ `Deployments` 
      * separate java lib with API
    * best would be to serve multiple APIs
        * swagger code generation Open API

## Topics to read on

* kustomize
* selectors
* secrets
* security
* Spring Boot's additions

## Deployments

### `minikube` with Several Nines' recommendations

__postgress__

Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment-minikube.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/create-database-minikube.sh`

Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. (optional) `./bin/drop-database-minikube.sh`
1. `./bin/delete-deployment-minikube.sh`

#### __rest-server__

Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment.sh`
1. (optional) `./bin/follow-logs.sh`

Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/delete-deployment.sh`

#### __rest-client__

Deployment

1. (optional) `./bin/generate-deployment.sh`
1. `./bin/create-deployment.sh`
1. (optional) `./bin/follow-logs.sh`

Rollback

1. (optional) `./bin/generate-deployment.sh`
1. (optional) `./bin/follow-logs.sh`
1. `./bin/delete-deployment.sh`