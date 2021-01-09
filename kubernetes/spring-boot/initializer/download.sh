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
	 -d groupId=md -d artifact=rest-server \
         -d packageName=md.rest_server\
         -d packaging=jar \
	 -d dependencies=webflux,actuator,lombok \
	 --output ${ARCHIVE}

unzip ${ARCHIVE} && rm -f ${ARCHIVE}

popd && popd
