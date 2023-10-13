#!/bin/sh

set -eu

PARENT_BRANCH=${PARENT_BRANCH:-main}
CHANGED_BRANCH_FILES=$(git diff --name-only --diff-filter=d origin/"${PARENT_BRANCH}"...HEAD :^tests | grep -i .py$ | cat )

if [ -z "${ONLY_CHECK_STAGED:=""}" ] ; then
    echo "Local + staged + branch changes"
    CHANGED_LOCAL_FILES=$(git diff --name-only --diff-filter=d HEAD :^tests | grep -i .py$ | cat)
else
    echo "Staged + branch changes"
    CHANGED_LOCAL_FILES=$(git diff --name-only --diff-filter=d --staged :^tests | grep -i .py$ | cat)
fi

CHANGED_FILES=$(echo "${CHANGED_BRANCH_FILES}" "${CHANGED_LOCAL_FILES}" | tr ' ' '\n' | sort | uniq)

export PARENT_BRANCH
export CHANGED_FILES
