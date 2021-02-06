#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail


"$DIR"/app/create-dry-run/deployment-with-services.sh
"$DIR"/app/create-dry-run/multi.sh