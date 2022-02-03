#!/bin/sh

set -eu

specifics_fld="./ci_specific"

if [ -d "${specifics_fld}" ]; then
    for test in "${specifics_fld}"/run_*.sh ; do
        "${test}" || echo "Failed!"
    done
fi
