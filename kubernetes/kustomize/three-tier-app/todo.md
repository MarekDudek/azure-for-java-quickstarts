# TODO

* configure with ConfigMaps
  * postgres
    * deployment
        * password of admin user - **DB admin credentials**
        * other PG possible configurations
            * admin user's database name - **DB admin database**
              * does not get out, for obfuscation
            * internal DB port **DB internal port**
              * for obfuscation
        * maybe use PG names for configs?
    * service
        * ports, target port and internal port - **DB service bearings**, **DB internal port**
          * external port pairs with URL
          * internal port for rebinding  
        * can type of service be configurable? - **meta**
            * this requires operating on selectors
            * other activities as well so would be great
    * setting up/tearing down database (admin on PG server)
        * also password of admin user - **DB admin credentials**, **Application user DB name**
        * services URL and port (port is external port from service) - **DB service bearings**
        * application user credentials - **Application user credentials**
    * copying HTML content
        * DB application user credentials - **Application user credentials**, **Application user DB name**
        * can volume/volume mount be configurable? - **meta**
            * by manifest itself probably not, no placeholders
            * probably requires kustomize
        * can path mount be configurable? - **meta**
            * same
    * clients
        * DB client
            * DB name - **Application user DB name**
            * DB application user credentials - **Application user credentials**
            * service URL and port - **DB service bearings**
  * nginx
    * deployment
        * volume/volume claim shared with file copier - **meta** 
        * name of mount and path can be very different then in file copier
        * internal port - **NG internal port**
        * other configurable nginx properties for obfuscation
    * service
        * type of service and port
          * type - **meta**
          * port mapping - **NG internal port**, **NG service bearings**
                * internally service name is Service's object name
          * port should be paired url - which is name in DNS, probably prepended with namespace   
        * because IP I don't know how to set, something more fancy than localhost
        * how to make IP/name not relay on?: 
            * minikube's tunnel
            * port-forwarding
        * how to integrate with Azure? 
  * volume/volume claim  - **meta**
* credentials in Secrets
  * [config-maps](config-maps.md)
  * [secrets](secrets.md)
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