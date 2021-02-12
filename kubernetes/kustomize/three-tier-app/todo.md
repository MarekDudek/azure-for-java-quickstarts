# TODO

* configure with ConfigMaps
  * postgres
    * deployment
        * password of admin user
        * other PG possible configurations
    * service
        * ports, target port and internal port
        * can type of service be configurable?
            * this requires operating on selectors
            * other activities as well so would be great
    * setting up/tearing down database (admin on PG server)
        * also password of admin user
        * services URL and port (port is external port from service)
        * application user credentials
    * copying HTML content
        * DB application user credentials
        * can volume/volume mount be configurable?
            * by manifest itself probably not, no placeholders
            * probably requires kustomize
        * can path mount be configurable?
            * same
    * clients
        * DB client
            * DB name
            * DB application user credentials
            * service URL and port
  * nginx
    * deployment
        * volume/volume claim shared with file copier
        * name of mount and path can be very different than in file copier
    * service
        * type of service and port
        * because IP I don't know how to set, something more fancy than localhost
        * how to make IP/name not relay on?: 
            * minikube's tunnel
            * port-forwarding
        * how to integrate with Azure? 
* credentials in Secrets
* common annotations
* split to deployments without time dependencies
    * so output from kustomize can be applied in one go
    * components
        * database server
        * database service - is it distinct from above?
        * admin of database server
        * web server
        * admin of web server?
        * admin of cluster
        * client
            * DB inserting
            * Messaging inserting
                * JMS
                * Kafka
        * file copier
            * glues DB server/service with 
* cross-cutting configurations
  * easily customizable
  * two types of volumes/volume mounts
  * three types of services
  * how to easily customize all combinations
  * consider namespaces and names combinations on top of that