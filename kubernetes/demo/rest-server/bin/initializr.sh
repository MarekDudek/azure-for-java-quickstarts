#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail


pushd "${THIS_DIR}"

PROJECT=../target/initializr

rm -rf ${PROJECT} && mkdir -p ${PROJECT} && pushd ${PROJECT}

ARCHIVE=archive.zip

curl https://start.spring.io/starter.zip \
   -d name="REST server" \
   -d description="REST server with Spring Boot" \
	 -d language=java \
	 -d javaVersion=11 \
	 -d type=maven-project \
	 -d bootVersion=2.4.1 \
	 -d groupId=md \
	 -d artifactId=rest-server \
   -d packageName=md.rest_server \
   -d packaging=jar \
	 -d dependencies=webflux,postgresql,h2,jpa,liquibase,actuator,lombok,devtools \
	 --output ${ARCHIVE}

unzip ${ARCHIVE} && rm -f ${ARCHIVE}

popd && popd
