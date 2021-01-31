#!/bin/bash
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "${SCRIPT}")
DIR=$(realpath --relative-to=. "${DIR}")
IFS=$'\n\t'
set -euxo pipefail


rm -fr "${DIR}"/build/
mkdir -p "${DIR}"/build/production
mkdir -p "${DIR}"/build/development

kubectl kustomize "${DIR}"/app/overlays/production  > "${DIR}"/build/production/production.yaml
kubectl kustomize "${DIR}"/app/overlays/development > "${DIR}"/build/development/development.yaml

pushd "${DIR}"/build/production
csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files production.yaml '/---/' '{*}'
mv manifest-0.yaml service.yaml
mv manifest-1.yaml deployment.yaml
popd

pushd "${DIR}"/build/development
csplit --prefix=manifest- --suffix="%d.yaml" --suppress-matched --elide-empty-files development.yaml '/---/' '{*}'
mv manifest-0.yaml service.yaml
mv manifest-1.yaml deployment.yaml
popd