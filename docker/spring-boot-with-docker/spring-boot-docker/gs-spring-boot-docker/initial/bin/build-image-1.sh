#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail


pushd "${THIS_DIR}"
pushd ..

mvn clean install

TAG=marekdudek/spring-boot-docker-1

docker build \
	--build-arg JAR_FILE=target/*.jar \
	-t ${TAG} \
	-f ./docker/Dockerfile1 .

docker images ${TAG}
docker push ${TAG}

popd
popd
