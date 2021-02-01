#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


rm -fr "${DIR}"/build/

mkdir -p "${DIR}"/build/prod

kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "${DIR}"/build/prod/__kustomized.yaml \
  "${DIR}"/app/overlays/prod

pushd "${DIR}"/build/prod
csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files __kustomized.yaml '/---/' '{*}'
mv manifest-0.yaml deployment.yaml
popd

mkdir -p "${DIR}"/build/dev

kustomize build \
  --load_restrictor=none \
  --reorder=none \
  --output "${DIR}"/build/dev/__kustomized.yaml \
  "${DIR}"/app/overlays/dev

pushd "${DIR}"/build/dev
csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files __kustomized.yaml '/---/' '{*}'
mv manifest-0.yaml deployment.yaml
popd

VERSION="002"
SNAPSHOT="${DIR}"/versions/v-${VERSION}
rm -rf "${SNAPSHOT}" && mkdir -p "${SNAPSHOT}"
cp --recursive "${DIR}"/build/* "${SNAPSHOT}"