#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

docker run -p 8082:8082 --name rest-server -t marekdudek/rest-server

curl http://localhost:8082/actuator/health; echo

popd