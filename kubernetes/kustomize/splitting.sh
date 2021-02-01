#!/bin/bash
set -euxo pipefail

function split() {
    BUILD="$1"
    FILE="$2"
    pushd "$BUILD"
    csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files "$FILE" '/---/' '{*}'
    NAMES=("${@:3}")
    COUNTER=-1
    for NAME in "${NAMES[@]}"
    do
      (( COUNTER++ )) || true
      mv manifest-"$COUNTER".yaml "$NAME"
    done
    popd
}