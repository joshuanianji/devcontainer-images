#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
edgedb instance link edgedb-docker --trust-tls-cert --host=edgedb --port=5656 --password

# Report result
reportResults
