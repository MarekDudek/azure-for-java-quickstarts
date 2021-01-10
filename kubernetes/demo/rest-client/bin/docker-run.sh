#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

docker run -p 8081:8081 --name rest-client -t marekdudek/rest-client

curl http://localhost:8081/actuator/health; echo

popd