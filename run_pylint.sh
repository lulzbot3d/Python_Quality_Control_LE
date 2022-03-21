#!/bin/sh

set -eu

pylint --rcfile=./ci/cfg/.pylintrc ./griffin/

exit 0
