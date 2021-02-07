#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail

APP="$DIR"/../..
BUILD="$APP"/build

rm -fr "$BUILD"

"$DIR"/empty-dir-volume.sh
"$DIR"/disposable-database.sh