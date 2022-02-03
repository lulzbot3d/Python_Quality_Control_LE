#!/bin/sh

set -eu

. ./docker_env/make_docker.sh

git fetch

for test in ./ci/run_*.sh ; do
    run_in_docker "${test}" || echo "Failed!"
done

echo "Testing done!"

exit 0
