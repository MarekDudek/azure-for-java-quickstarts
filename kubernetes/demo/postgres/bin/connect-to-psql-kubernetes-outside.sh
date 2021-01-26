#!/bin/bash
THIS_FILE=$(readlink -f "$0")
THIS_DIR=$(dirname "${THIS_FILE}")
IFS=$'\n\t'
set -euox pipefail

#psql -h localhost -U postgres --password -p 5439 postgres

psql -h localhost -p 5439 -U postgres postgres
