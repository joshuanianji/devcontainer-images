#!/bin/bash
cd $(dirname "$0")
source test-utils.sh
source edgedb.sh

ls -al
pwd

test_edgedb_connection

# Report result
reportResults
