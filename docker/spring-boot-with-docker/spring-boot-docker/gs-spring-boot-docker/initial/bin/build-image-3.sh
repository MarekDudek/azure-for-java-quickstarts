#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}" ; pushd ..

mvn clean install

mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

TAG=marekdudek/spring-boot-docker-3
docker build -t ${TAG} -f ./docker/Dockerfile3 .

docker images ${TAG}

popd ; popd
