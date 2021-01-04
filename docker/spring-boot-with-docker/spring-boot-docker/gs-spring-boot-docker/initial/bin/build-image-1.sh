#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"/..

mvn clean install

docker build -t md/spring-boot-docker-1 -f ./docker/Dockerfile1 .

#docker image prune --force
docker images

popd
