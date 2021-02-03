#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail

"${DIR}"/web-server/create-dry-run.sh
"${DIR}"/web-server/kustomize.sh

"${DIR}"/web-client/create-dry-run.sh
"${DIR}"/web-client/kustomize.sh