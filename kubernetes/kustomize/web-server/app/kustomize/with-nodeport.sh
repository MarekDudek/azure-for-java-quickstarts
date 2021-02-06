#!/usr/bin/env bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")
DIR=$(realpath --relative-to=. "$DIR")
IFS=$'\n\t'
set -euxo pipefail
source "$DIR"/../../../splitting.sh

WEB_SERVER="$DIR"/../..
BUILD="$WEB_SERVER"/build/with-nodeport

mkdir -p "$BUILD"

kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$BUILD"/__kustomized.yaml \
  "$WEB_SERVER"/app/overlays/with-nodeport

split "$BUILD" __kustomized.yaml \
  deployment.yaml \
  service-nodeport.yaml