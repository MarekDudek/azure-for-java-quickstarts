#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail
source "$DIR"/../splitting.sh


rm -fr "$DIR"/build/

PROD_BUILD="$DIR"/build/prod
mkdir -p "$PROD_BUILD"
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$PROD_BUILD"/__kustomized.yaml \
  "$DIR"/app/overlays/prod
split "$PROD_BUILD" __kustomized.yaml \
  deployment.yaml \
  nodeport-service.yaml \
  loadbalancer-service.yaml

DEV_BUILD="$DIR"/build/dev
mkdir -p "$DEV_BUILD"
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$DEV_BUILD"/__kustomized.yaml \
  "$DIR"/app/overlays/dev
split "$DEV_BUILD" __kustomized.yaml \
  deployment.yaml \
  nodeport-service.yaml \
  loadbalancer-service.yaml

SNAPSHOT="$DIR"/versions/v-002
rm -rf "$SNAPSHOT" ; mkdir -p "$SNAPSHOT"
cp -r "$DIR"/build/* "$SNAPSHOT"