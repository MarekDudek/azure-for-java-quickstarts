#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"
source common.sh

docker run -p 8082:8082 --name rest-server -t "${IMAGE}"

curl http://localhost:8082/actuator/health; echo

popd