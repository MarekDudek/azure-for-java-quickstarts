#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"/..

mvn clean install

mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

TAG=md/spring-boot-docker-3:latest
docker image rm ${TAG} --force
docker build -t ${TAG} -f ./docker/Dockerfile3 .

docker images

popd
