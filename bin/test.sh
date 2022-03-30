#!/bin/bash

if [ "$*" == "" ]; then
  echo "ERROR: Please provide a container name to test!"
  exit 1
fi

SCRIPT_PATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
BIN_DIR="${SCRIPT_PATH}"
BASE_DIR=$(pwd)
TEST_CONTAINER_IMAGE=$1
CINC_AUDITOR_CONTAINER_IMAGE=polymathrobotics/cinc-auditor-amd64:4.52.9
if [ "$(uname -s)" = Darwin ] && [ "$(uname -m)" = arm64 ]; then
  CINC_AUDITOR_CONTAINER_IMAGE=polymathrobotics/cinc-auditor-arm64:4.52.9
fi
# No need to pull on every build because we're referring to a speicifc tag
PROFILE_DIR="${BASE_DIR}/../test"

CONTAINER_ID=$(docker container run --interactive --entrypoint /bin/bash --detach $TEST_CONTAINER_IMAGE )

function cleanup()
{
  echo "==> stopping ${CONTAINER_ID}"
  docker container stop ${CONTAINER_ID}
  echo "==> removing ${CONTAINER_ID}"
  docker container rm ${CONTAINER_ID}
}

trap cleanup EXIT

echo ${CONTAINER_ID}
docker ps

# run cinc-auditor
echo "==> running cinc-auditor against ${TEST_CONTAINER_IMAGE}"
docker container run -t --rm -v "${PROFILE_DIR}:/share" -v /var/run/docker.sock:/var/run/docker.sock ${CINC_AUDITOR_CONTAINER_IMAGE} exec . --no-create-lockfile -t docker://${CONTAINER_ID}
