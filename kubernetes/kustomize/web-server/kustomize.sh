#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail
source "$DIR"/../splitting.sh


rm -fr "$DIR"/build/

"$DIR"/app/kustomize/prod.sh
"$DIR"/app/kustomize/dev.sh
"$DIR"/app/kustomize/with-clusterip.sh
"$DIR"/app/kustomize/with-nodeport.sh
"$DIR"/app/kustomize/with-loadbalancer.sh
"$DIR"/app/kustomize/multi.sh

SNAPSHOT="$DIR"/versions/v-005
rm -rf "$SNAPSHOT" ; mkdir -p "$SNAPSHOT"
cp -r "$DIR"/build/* "$SNAPSHOT"