#!/bin/bash

source test-utils.sh

test_edgedb_connection() {
    check "Connect to edgedb" bash -c "echo 'secret' | edgedb instance link edgedb-docker --trust-tls-cert --host=edgedb --port=5656 --non-interactive --password-from-stdin"

    # Check if the instance is linked
    NAME=$(edgedb instance list --json | jq '.[0].name' -r)
    echo "NAME: '$NAME'"
    check "Instance is linked" test "$NAME" == 'edgedb-docker'

    # check to see if status is running
    STATUS=$(edgedb instance list --json | jq '.[0]["remote-status"]' -r)
    echo "STATUS: '$STATUS'"
    check "Instance is running" test "$STATUS" == 'up'
}
