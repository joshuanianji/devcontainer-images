#!/bin/bash
cd $(dirname "$0")
source test-utils.sh
source edgedb.sh

test_edgedb_connection

cd test-project

# initialize project
check "initializing project" bash -c "edgedb project init --non-interactive --server-instance edgedb-docker --link"

check "Creating initial edgedb migration" bash -c "edgedb migration create"
check "Applying initial edgedb migration" bash -c "edgedb migrate"

check "Running npm install" bash -c "cargo run"

# Report result
reportResults
