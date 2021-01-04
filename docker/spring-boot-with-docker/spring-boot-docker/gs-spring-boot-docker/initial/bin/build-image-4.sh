#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"/..

./mvnw clean install
TAG=md/spring-boot-docker-4:latest
./mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=${TAG}
docker images

popd
