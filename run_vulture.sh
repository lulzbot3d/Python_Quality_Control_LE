#!/bin/sh

set -eu

vulture --min-confidence 95 --exclude tests/,.git/,venv/ ./

exit 0
