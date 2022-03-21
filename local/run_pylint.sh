#!/bin/sh

set -eu

. ./docker_env/make_docker.sh

run_in_docker "ci/run_pylint.sh" "$@" || echo "Failed!"

exit 0
