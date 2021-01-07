#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd ${THIS_DIR} 

DOWNLOAD=./download

rm -rf ${DOWNLOAD} && mkdir ${DOWNLOAD} && pushd ${DOWNLOAD}

PROJECT=project.zip

curl https://start.spring.io/starter.zip \
         -d name=Demo -d description="Spring Boot Demo" \
	 -d language=java -d javaVersion=11 \
	 -d type=maven-project \
	 -d bootVersion=2.4.1 \
	 -d groupId=md -d artifact=demo \
         -d packageName=md.demo \
         -d packaging=jar \
	 -d dependencies=webflux,actuator \
	 --output ${PROJECT}

unzip ${PROJECT} && rm -f ${PROJECT}

popd && popd
