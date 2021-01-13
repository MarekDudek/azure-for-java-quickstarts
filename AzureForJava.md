Log into Azure with bash on local machine
=========================================

az login
(browser opens, input credentials)
displays subscriptions:

[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "718c9ed0-f927-4124-8ea8-4602e8c9905a",
    "id": "24e956c0-ba48-45c7-9add-4d903401f23b",
    "isDefault": true,
    "managedByTenants": [],
    "name": "My free subscription",
    "state": "Enabled",
    "tenantId": "718c9ed0-f927-4124-8ea8-4602e8c9905a",
    "user": {
      "name": "marek.dudek@gmail.com",
      "type": "user"
    }
  }
]


Delete resource group
=====================

az group delete --name <resource group name> --yes


Tasks
=====

Done
----

* Java JAR and WAR apps deployed to App Service
* PostgreSQL database set up
* Logging configured


To Do
-----

* Databases: Azure Cosmos and Azure SQL Database
* Java and DB: JDBC, JPA, Spring Data
* Migrate database using export and import
* More logging options, lots of them
* Scale up
* Scale out
* Scale out manually or automatically
* Set up CI/CD


# [Deploy Java Apps](deploy-java-apps/linux-and-tomcat/DeployJavaApps.md)
# [Spring Cloud](spring-cloud/SpringCloud.md)
# [Serverless](serverless-functions/Serverless.md)
# [Docker commands](docker/how-to-get-started-with-docker/docker-commands/DockerCommands.md)
# [Java with Docker](docker/how-to-get-started-with-docker/java-with-docker/JavaWithDocker.md)
# [Dockerfiles](docker/how-to-get-started-with-docker/dockerfiles/DockerFiles.md)
# [Spring Boot with Docker](docker/spring-boot-with-docker/spring-boot-docker/SpringBootWithDocker.md)
# [Kubernetes](kubernetes/Kubernetes.md)
# [Kubernetes Demo](kubernetes/demo/KubernetesDemo.md)
# [Kubernetes Spring Boot](kubernetes/spring-boot/KubernetesSpringBoot.md)
