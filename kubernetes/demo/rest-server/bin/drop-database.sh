#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

dropdb --echo rest-server -U postgres -h localhost
dropuser --echo rest-server -U postgres -h localhost