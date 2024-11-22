#!/bin/bash

set -e

source test-utils.sh
source edgedb.sh

cd $(dirname "$0")

test_edgedb_connection

cd test-project

# initialize project
check "initializing project" bash -c "edgedb project init --non-interactive --server-instance edgedb-docker --link"

check "Creating initial edgedb migration" bash -c "edgedb migration create"
check "Applying initial edgedb migration" bash -c "edgedb migrate"

# running npm install
check "Running npm install" bash -c "npm install"

check "Running seed.ts" bash -c "npx tsx seed.ts"
check "Running query.ts" bash -c "npx tsx query.ts"

reportResults
