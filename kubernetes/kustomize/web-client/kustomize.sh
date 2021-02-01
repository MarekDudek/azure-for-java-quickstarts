#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail
source "$DIR"/../splitting.sh


rm -fr "$DIR"/build/

mkdir -p "$DIR"/build/prod
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$DIR"/build/prod/__kustomized.yaml \
  "$DIR"/app/overlays/prod
split "$DIR"/build/prod __kustomized.yaml \
  deployment.yaml

mkdir -p "$DIR"/build/dev
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$DIR"/build/dev/__kustomized.yaml \
  "$DIR"/app/overlays/dev
split "$DIR"/build/dev __kustomized.yaml \
  deployment.yaml

SNAPSHOT="$DIR"/versions/v-002
rm -rf "$SNAPSHOT" ; mkdir -p "$SNAPSHOT"
cp -r "$DIR"/build/* "$SNAPSHOT"