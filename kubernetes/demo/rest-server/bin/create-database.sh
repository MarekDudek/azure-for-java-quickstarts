#!/bin/bash
IFS=$'\n\t'
set -euox pipefail

createuser --echo --pwprompt rest-server -U postgres -h localhost
createdb --echo --owner=rest-server rest-server -U postgres -h localhost