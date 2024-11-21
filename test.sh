#!/bin/bash
TEMPLATE_ID="$1"

# Run tests for a specific template
# Also ensure that containers ånd volumes are cleaned up afterward

./.github/actions/smoke-test/build.sh $TEMPLATE_ID
BUILD_EXIT_CODE=$?
./.github/actions/smoke-test/test.sh $TEMPLATE_ID
TEST_EXIT_CODE=$?

# if test fails, we have to cleanup
# no `devcontainer down` command yet... https://github.com/devcontainers/cli/issues/386
SRC_DIR="/tmp/${TEMPLATE_ID}"
ID_LABEL="test-container=${TEMPLATE_ID}"

echo "*** Running cleanup"
RUNNING_CONTAINERS=$(docker container ls -f "name=${TEMPLATE_ID}_devcontainer" -q)
for CONTAINER in $RUNNING_CONTAINERS; do
    echo "Stopping container $(docker rm -f $CONTAINER)"
done

VOLUMES=$(docker volume ls -q -f "name=${TEMPLATE_ID}_devcontainer")
for VOLUME in $VOLUMES; do
    echo "Removing volume $(docker volume rm $VOLUME)"
done
rm -rf "${SRC_DIR}"

# Exit with the exit code of the test script if it failed, otherwise with the exit code of the build script
if [ $TEST_EXIT_CODE -ne 0 ]; then
    exit $TEST_EXIT_CODE
else
    exit $BUILD_EXIT_CODE
fi
