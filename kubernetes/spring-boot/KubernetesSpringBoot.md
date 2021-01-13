Spring Boot app generation
==========================

`curl https://start.spring.io/starter.tgz -d dependencies=webflux,actuator | tar -xzvf -`


Contenerizing with Spring Boot plugin
=====================================


`./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=marekdudek/k8s-demo`


Multiple Kubernetes objects in single file
==========================================

`kubectl create deployment demo --image=springguides/demo --dry-run=client -o=yaml > deployment.yaml`

`echo --- >> deployment.yaml`

`kubectl create service clusterip demo --tcp=8080:8080 --dry-run=client -o=yaml >> deployment.yaml`

View all objects in cluster
===========================

`kubectl get all`


Port forwarding with kubectl
============================

`kubectl port-forward svc/demo 8080:8080`

Health check
============

`curl localhost:8080/actuator/health`

Actuator
========

`curl localhost:8080/actuator | jq .`

Probes and lifecycle
====================

	apiVersion: apps/v1
	kind: Deployment
	metadata:
	  creationTimestamp: null
	  labels:
	    app: gs-spring-boot-k8s
	  name: gs-spring-boot-k8s
	spec:
	  replicas: 1
	  selector:
	    matchLabels:
	      app: gs-spring-boot-k8s
	  strategy: {}
	  template:
	    metadata:
	      creationTimestamp: null
	      labels:
	        app: gs-spring-boot-k8s
	    spec:
	      containers:
	      - image: spring-k8s/gs-spring-boot-k8s:snapshot
	        name: gs-spring-boot-k8s
	        resources: {}
	        livenessProbe:					<----
	          httpGet:
	            path: /actuator/health/liveness
	            port: 8080
	        readinessProbe:					<----
	          httpGet:
	            path: /actuator/health/readiness
	            port: 8080
	        lifecycle:					<----
	          preStop:
	            exec:
	              command: ["sh", "-c", "sleep 10"]		<----
	status: {}

