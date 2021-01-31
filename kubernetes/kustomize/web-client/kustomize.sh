#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


rm -fr "${DIR}"/build/

mkdir -p "${DIR}"/build/prod
kubectl kustomize "${DIR}"/app/overlays/prod  > "${DIR}"/build/prod/__kustomized.yaml
pushd "${DIR}"/build/prod
csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files __kustomized.yaml '/---/' '{*}'
mv manifest-0.yaml deployment.yaml
popd

mkdir -p "${DIR}"/build/dev
kubectl kustomize "${DIR}"/app/overlays/dev > "${DIR}"/build/dev/__kustomized.yaml
pushd "${DIR}"/build/dev
csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files __kustomized.yaml '/---/' '{*}'
mv manifest-0.yaml deployment.yaml
popd