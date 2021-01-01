#!/bin/bash
THIS_FILE=$(readlink -f $0)
THIS_DIR=`dirname ${THIS_FILE}`
IFS=$'\n\t'
set -euox pipefail

pushd ${THIS_DIR}

./suite-set-up.sh
./suite-tear-down.sh

popd
