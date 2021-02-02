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
  service-nodeport.yaml

DEV_BUILD="$DIR"/build/dev
mkdir -p "$DEV_BUILD"
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$DEV_BUILD"/__kustomized.yaml \
  "$DIR"/app/overlays/dev
split "$DEV_BUILD" __kustomized.yaml \
  deployment.yaml \
  service-nodeport.yaml

WITH_CLUSTERIP_BUILD="$DIR"/build/with-clusterip
mkdir -p "$WITH_CLUSTERIP_BUILD"
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$WITH_CLUSTERIP_BUILD"/__kustomized.yaml \
  "$DIR"/app/overlays/with-clusterip
split "$WITH_CLUSTERIP_BUILD" __kustomized.yaml \
  deployment.yaml \
  service-clusterip.yaml

WITH_NODEPORT_BUILD="$DIR"/build/with-nodeport
mkdir -p "$WITH_NODEPORT_BUILD"
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$WITH_NODEPORT_BUILD"/__kustomized.yaml \
  "$DIR"/app/overlays/with-nodeport
split "$WITH_NODEPORT_BUILD" __kustomized.yaml \
  deployment.yaml \
  service-nodeport.yaml

WITH_LOADBALANCER_BUILD="$DIR"/build/with-loadbalancer
mkdir -p "$WITH_LOADBALANCER_BUILD"
kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "$WITH_LOADBALANCER_BUILD"/__kustomized.yaml \
  "$DIR"/app/overlays/with-loadbalancer
split "$WITH_LOADBALANCER_BUILD" __kustomized.yaml \
  deployment.yaml \
  service-loadbalancer.yaml

SNAPSHOT="$DIR"/versions/v-003
rm -rf "$SNAPSHOT" ; mkdir -p "$SNAPSHOT"
cp -r "$DIR"/build/* "$SNAPSHOT"