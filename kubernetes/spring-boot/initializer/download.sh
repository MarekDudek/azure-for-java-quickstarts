#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR} 

PROJECT=./project

rm -rf ${PROJECT} && mkdir ${PROJECT} && pushd ${PROJECT}

ARCHIVE=archive.zip

curl https://start.spring.io/starter.zip \
         -d name="Spring Boot Kubernetes Demo" -d description="Spring Boot application running on Kubernetes" \
	 -d language=java -d javaVersion=11 \
	 -d type=maven-project \
	 -d bootVersion=2.4.1 \
	 -d groupId=md -d artifact=k8s-demo \
         -d packageName=md.k8s.demo \
         -d packaging=jar \
	 -d dependencies=webflux,actuator \
	 --output ${ARCHIVE}

unzip ${ARCHIVE} && rm -f ${ARCHIVE}

popd && popd
