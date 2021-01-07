
* check image sizes after optimizing
* check build context sizes after optimizing

arg is Maven-specific

Running image build with non-default Dockerfile
===============================================
docker build -t md/spring-boot-docker -f Dockerfile2 .

Running image
=============
docker run --name spa --rm -t marekdudek/spring-boot-docker-1 -p 8080:8080

name param has to be first?

image is JDK, check with JRE
	JRE is 20 MB smaller
what is smallest base image with Java?

* check build times
* check startup times

Running interactive
===================
docker run -it --entrypoint /bin/sh spa
docker exec -it spa /bin/sh


Spring Boot-specific layers
===========================

* requires manual unpacking
mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

Exploding JAR may result in different classpath order


Spring Boot profile
===================

docker run -e "SPRING_PROFILES_ACTIVE=prod" -p 8080:8080 -t springio/gs-spring-boot-docker

Debugging
=========

docker run -e "JAVA_TOOL_OPTIONS=-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n" -p 8080:8080 -p 5005:5005 -t springio/gs-spring-boot-docker

IntelliJ -> Run -> Edit Configurations -> Template -> Remote JVM Debug -> Create Configuration


End goal
========

Build with Docker file, optimized for building convenience.
Small size, fast build - good trade-off
Unpacked Spring Boot app with layers
Possibility to pass arguments:
	JAVA_OPTS
	Spring profiles
Possibility to debug remotely
Secure
	group and user
Entry point script
Possibility to attach to container
Both in Docker and Kubernetes

Docker
======
docker run --name spa --rm -e "JAVA_TOOL_OPTIONS=-agentlib:jdwp=transport=dt_socket,address=5005,server=y,suspend=n" -e "JAVA_OPTS=-Ddebug" -p 8080:9000 -p 5005:5005 -t marekdudek/spring-boot-docker-5 --server.port=9000
docker exec -it spa /bin/sh

Kubernetes
==========

kubectl create deployment spa --image=marekdudek/spring-boot-docker-5
kubectl expose deployment spa --port 8080 --type=LoadBalancer
