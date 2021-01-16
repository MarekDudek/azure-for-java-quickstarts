#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

dropdb --echo rest-server -U postgres -h localhost
dropuser --echo rest-server -U postgres -h localhost