#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

pushd "${THIS_DIR}"

liquibase --changeLogFile=mydatabase_changelog.xml --defaultsFile=./src/main/resources/liquibase.properties  generateChangeLog

popd