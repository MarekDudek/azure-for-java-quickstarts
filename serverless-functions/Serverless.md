Configure your local environment
================================

* requires installation of Azure Functions Core Tools

Function project
================

Can contain one or more functions that share same local and hosting configurations.

Created with Maven archetype

mvn archetype:generate -DarchetypeGroupId=com.microsoft.azure -DarchetypeArtifactId=azure-functions-archetype -DjavaVersion=8

Can be Java 8 or 11.

JAVA_HOME must be set to run locally.

Azure configuration in pom.xml

App Service Plan Name can be defined.

Run locally
===========

mvn clean package
mvn azure-functions:run

Deploy to Azure
===============

mvn azure-functions:deploy

Stream logs
===========

func azure functionapp logstream my-function-proj-20201202221617178

Clean up resources
==================

az group delete --name java-functions-group
