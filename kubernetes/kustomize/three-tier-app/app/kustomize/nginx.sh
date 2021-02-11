#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail
source "$DIR"/../../../splitting.sh

APP="$DIR"/../..
BUILD="$APP"/build/nginx

rm -fr "$BUILD" ; mkdir -p "$BUILD"

kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$BUILD"/__kustomized.yaml \
  "$APP"/app/overlays/nginx

split "$BUILD" __kustomized.yaml \
  nginx-on-k8s-deployment.yaml \
  nginx-on-k8s-service-clusterip.yaml

SNAPSHOT="$APP"/versions/v-001
rm -rf "$SNAPSHOT" ; mkdir -p "$SNAPSHOT"
cp -r "$APP"/build/* "$SNAPSHOT"