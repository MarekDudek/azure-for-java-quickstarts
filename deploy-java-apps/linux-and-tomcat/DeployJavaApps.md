
Cloned Spring Boot example web application. It has nothing Azure-specific.

Maven Plugin for Azure Web Apps

Goals
	configure
		adds Azure configuration, rewrites pom.xml

To configure application
========================

mvn com.microsoft.azure:azure-webapp-maven-plugin:1.12.0:config

adds plugin with configuration, based on 
	* info from subscription read by `az login`
	* questions asked
verbatim, constants set

Resource group must be unique within subscription.
Web app name must be unique in Azure - part of URL.
How to explicitely name app plan?


To reformat pom.xml
===================

xmllint ./pom.xml > ./pom.xml.bak && mv pom.xml.bak pom.xml


To deploy to Azure
==================

mvn package azure-webapp:deploy

Creates automatically if none exists
	* resource group
	* app service

TODO
====

\/ check with Tomcat (war packaging)
*  configure authentication, based on description of plugin and examples
*  more monitoring options
